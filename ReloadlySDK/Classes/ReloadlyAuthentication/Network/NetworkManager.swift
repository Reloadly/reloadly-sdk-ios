//
//  NetworkManager.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

enum HttpMethod: String {
    case get = "get"
    case post = "post"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var timeoutIntervalForRequest = 60.0
    var timeoutIntervalForResource = 60.0
    
    func dataTask(serviceURL: String, httpMethod: HttpMethod, parameters: [String: Any]?, proxyConfigurator: ProxyConfigurator?, completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        request(serviceURL: serviceURL, httpMethod: httpMethod, parameters: parameters, proxyConfigurator: proxyConfigurator, completion: completion)
    }
    func dataAuthTask(serviceURL: String, httpMethod: HttpMethod, parameters: [String:String]?, proxyConfigurator: ProxyConfigurator?, completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        requestAuth(serviceURL: serviceURL, httpMethod: httpMethod, parameters: parameters, proxyConfigurator: proxyConfigurator, completion: completion)
    }
    
    private func requestAuth(serviceURL: String, httpMethod: HttpMethod, parameters: [String:String]?, proxyConfigurator: ProxyConfigurator? = nil, completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        
        var request = URLRequest(url: URL(string: "https://auth.reloadly.com\(serviceURL)")!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        if let unwrapedParameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: unwrapedParameters, options: .prettyPrinted)
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = timeoutIntervalForRequest
        sessionConfig.timeoutIntervalForResource = timeoutIntervalForResource
        var session = URLSession(configuration: sessionConfig)
     
        /// Set proxy
        if let proxyConfigurator = proxyConfigurator {
            ReloadlyAuthentication.shared.logger.info("Used proxy host: \(proxyConfigurator.hostUrl)\n port: \(proxyConfigurator.port)")
            session = session.withProxy(proxyURL: proxyConfigurator.hostUrl, proxyPort: proxyConfigurator.port)
            if let username = proxyConfigurator.username, let password = proxyConfigurator.password {
                request = request.proxyWithAutentification(username: username, password: password)
            }
        }
        
        session.dataTask(with: request) { (data, response, error) in
            ReloadlyAuthentication.shared.logger.debug(response as Any)
            if let uwrapedData = data {
                completion(.success(uwrapedData))
            }
            if let unwrapedError = error {
                completion(.failure(unwrapedError))
            }
        }.resume()
    }
    
    private func request(serviceURL: String, httpMethod: HttpMethod, parameters: [String:Any]?, proxyConfigurator: ProxyConfigurator? = nil, completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        
        var request = URLRequest(url: URL(string:"\(ReloadlyAuthentication.shared.service.backendEnvironment.baseURL)\(serviceURL)")!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        if let unwrapedParameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: unwrapedParameters, options: .prettyPrinted)
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = timeoutIntervalForRequest
        sessionConfig.timeoutIntervalForResource = timeoutIntervalForResource
        var session = URLSession(configuration: sessionConfig)
        
        if let authToken = ReloadlyAuthentication.shared.getAccessToken(), authToken.isValid {
            request.setValue("Bearer \(authToken.accessToken)", forHTTPHeaderField: "Authorization")
        } else {
            //wait till token refreshed
            let group = DispatchGroup()
                group.enter()
                DispatchQueue.global(qos: .default).async {
                    self.refreshToken() {
                        group.leave()
                    }
               }
               group.wait()
        }
        /// Set proxy
        if let proxyConfigurator = proxyConfigurator {
            ReloadlyAuthentication.shared.logger.info("Used proxy host: \(proxyConfigurator.hostUrl)\n port: \(proxyConfigurator.port)")
            session = session.withProxy(proxyURL: proxyConfigurator.hostUrl, proxyPort: proxyConfigurator.port)
            if let username = proxyConfigurator.username, let password = proxyConfigurator.password {
                request = request.proxyWithAutentification(username: username, password: password)
            }
        }
        
        session.dataTask(with: request) { (data, response, error) in
            ReloadlyAuthentication.shared.logger.debug(response as Any)
            if let uwrapedData = data {
                completion(.success(uwrapedData))
            }
            if let unwrapedError = error {
                completion(.failure(unwrapedError))
            }
        }.resume()
    }
    
    fileprivate func refreshToken(completion: @escaping (() -> ())) {
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            switch result {
            case .success(_):
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
}


extension URLSession {

    func withProxy(proxyURL: String, proxyPort: Int) -> URLSession {
        let configuration = self.configuration
        configuration.connectionProxyDictionary = [
            kCFNetworkProxiesHTTPEnable as AnyHashable : true,
            kCFNetworkProxiesHTTPPort as AnyHashable : proxyPort,
            kCFNetworkProxiesHTTPProxy as AnyHashable : proxyURL
        ]
        return URLSession(configuration: configuration, delegate: self.delegate, delegateQueue: self.delegateQueue)
    }
}

extension URLRequest {
    
    mutating func proxyWithAutentification(username: String, password: String) -> URLRequest {
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        self.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        return self
    }
}

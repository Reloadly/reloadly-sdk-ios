//
//  ReloadlyAuthentication.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public enum ServiceError: Error {
    // MARK: Internal
    case unableToProcesRequest(message: String)
    case emptyCredentials(message: String)
    case runtime(error: Error)
}

public class ReloadlyAuthentication {

    public static let shared = ReloadlyAuthentication()
    let storageKey = "OAuth2Token"
    /// Service's backend environment. Default value is `.production`. Make sure to use `.production` in you release (App Store)
    public private(set) var service: AuthenticationServiceProtocol = AuthenticationService(backendEnvironment: .sandbox)
    let storage = Keychain()
    private var clientId: String?
    private var clientSecret: String?
    private var currentToken: OAuth2Token? {
        get { return storage.get(key: storageKey) }
        set { if let newValue = newValue { storage.set(value: newValue, key: storageKey) } }
    }
    
    internal let logger = Logger()
    internal var proxyConfiguration: ProxyConfigurator?

    
    private init() {
        logger.formatter = .default
        logger.info("Reloadly SDK Authentication initialised")
    }
    /**
     `func configure(with clientId: String, clientSecret: String, service: AuthenticationServiceProtocol, logLevel: Level = .info,    proxyConfiguration: ProxyConfigurator? = nil)`
     
     - parameter clientId: Client Id.
     - parameter clientSecret: Client secret.
     - parameter service: Set environment wich you want to use (production or sandbox).
     - parameter logLevel: Change loger level to see all logs, by default used .info level.
     - parameter proxyConfiguration: Proxy Configuration, username and password are optional.
     - parameter useTelemetry: useTelemetry,by default is true but you can set it to false


     # Notes: #
     1. Put this code at  `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)` and set all info
     
     # Example #
     ```
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOtestrw", clientSecret: "c7gcNR4dOIAlmalojV35okbq--testsdfdsfsf", service: AuthenticationService(backendEnvironment: .sandbox), useTelemetry: true)
     ```
     */
    public func configure(with clientId: String? = nil, clientSecret: String? = nil, service: AuthenticationServiceProtocol? = nil, logLevel: Level = .info, proxyConfiguration: ProxyConfigurator? = nil, useTelemetry: Bool = true) {
        let dictionary = Bundle.main.infoDictionary
        self.service = service ?? AuthenticationService(backendEnvironment: (dictionary?["ReloadlySDKEnvironment"] as? String) ?? "sandbox")
        self.clientId = clientId ?? (dictionary?["ReloadlySDKSecretId"] as? String) ?? ""
        self.clientSecret = clientSecret ?? (dictionary?["ReloadlySDKClientId"] as? String) ?? ""
        self.logger.minLevel = logLevel
        self.proxyConfiguration = proxyConfiguration
        NetworkManager.shared.useTelemetry = useTelemetry
    }
    
    public func setCustomTimeouts(readTimeout: Double, writeTimeout: Double) {
        NetworkManager.shared.timeoutIntervalForResource = readTimeout
        NetworkManager.shared.timeoutIntervalForRequest = writeTimeout
        logger.debug("Set custom timeout for write: \(writeTimeout) s. read: \(writeTimeout)")
    }
    
    public func requestAccessToken(completionHandler: @escaping (Result<OAuth2Token, Error>) -> Void) {
        guard let clientId = clientId, let clientSecret = clientSecret, !clientId.isEmpty, !clientSecret.isEmpty else {
            self.logger.debug("ClientId or clientSecret is empty")
            completionHandler(.failure(ServiceError.emptyCredentials(message: "ClientId or clientSecret is empty")))
            return
        }
        let parameters = ["client_id": clientId,
                          "client_secret": clientSecret,
                          "grant_type": "client_credentials",
                          "audience": service.backendEnvironment.baseURL]
        self.logger.debug("\(parameters)")

        NetworkManager.shared.dataAuthTask(serviceURL: "/oauth/token", httpMethod: .post, parameters: parameters, proxyConfigurator: proxyConfiguration, completion: { result in
            switch result {
            case .success(let data):
                do {
                    var oauth2Token: OAuth2Token = try JSONDecoder().decode(OAuth2Token.self, from: data)
                    oauth2Token.date = Date()
                    self.currentToken = oauth2Token
                    self.logger.debug("Receive token: \(oauth2Token)")
                    completionHandler(.success(oauth2Token))
                } catch let error {
                    if let error: ErrorModel = try? JSONDecoder().decode(ErrorModel.self, from: data) {
                        self.logger.warning("\(error)")
                        completionHandler(.failure(ServiceError.unableToProcesRequest(message: error.message)))
                    } else {
                        self.logger.error("\(error)")
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                self.logger.error("\(error)")
                completionHandler(.failure(error))
            }
        })
    }
    
    public func getAccessToken() -> OAuth2Token? {
        return currentToken
    }
}

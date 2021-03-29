//
//  ReloadlyAirtime+Operators.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 17.03.2021.
//

import Foundation

extension ReloadlyAirtime {
    public func getOperatorsList(page: Int = 1,
                                 size: Int = 20,
                                 suggestedAmounts: Bool? = nil,
                                 suggestedAmountsMap: Bool? = nil,
                                 includeBundles: Bool? = nil,
                                 simplified: Bool? = nil,
                                 includePin: Bool? = nil,
                                 includeData: Bool? = nil,
                                 completionHandler: @escaping (Result<OperatorArray, Error>) -> Void) {
        var endpoint = "/operators?&page=\(page)&size=\(size)"
        if let includeBundles = includeBundles {
            endpoint.append("&includeBundles=\(includeBundles)")
        }
        if let suggestedAmountsMap = suggestedAmountsMap {
            endpoint.append("&suggestedAmountsMap=\(suggestedAmountsMap)")
        }
        if let suggestedAmounts = suggestedAmounts {
            endpoint.append("&suggestedAmounts=\(suggestedAmounts)")
        }
        if let simplified = simplified {
            endpoint.append("&simplified=\(simplified)")
        }
        if let includePin = includePin {
            endpoint.append("&includePin=\(includePin)")
        }
        if let includeData = includeData {
            endpoint.append("&includeData=\(includeData)")
        }
        NetworkManager.shared.dataTask(serviceURL: endpoint, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<OperatorArray, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func getOperatorById(id: Int,
                                suggestedAmounts: Bool? = nil,
                                suggestedAmountsMap: Bool? = nil,
                                completionHandler: @escaping (Result<OperatorDetails, Error>) -> Void) {
        var endpoint = "/operators/\(id)"
        if let suggestedAmountsMap = suggestedAmountsMap {
            let prefix = endpoint.contains("=") ? "&" : "?"
            endpoint.append("\(prefix)suggestedAmountsMap=\(suggestedAmountsMap)")
        }
        if let suggestedAmounts = suggestedAmounts {
            let prefix = endpoint.contains("=") ? "&" : "?"
            endpoint.append("\(prefix)suggestedAmounts=\(suggestedAmounts)")
        }
        NetworkManager.shared.dataTask(serviceURL: endpoint, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<OperatorDetails, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func getOperatorForPhone(phone: String,
                                    countryCode: String,
                                    suggestedAmounts: Bool? = nil,
                                    suggestedAmountsMap: Bool? = nil,
                                    completionHandler: @escaping (Result<OperatorDetails, Error>) -> Void) {
        var endpoint = "/operators/auto-detect/phone/\(phone)/countries/\(countryCode)"
        if let suggestedAmountsMap = suggestedAmountsMap {
            let prefix = endpoint.contains("=") ? "&" : "?"
            endpoint.append("\(prefix)suggestedAmountsMap=\(suggestedAmountsMap)")
        }
        if let suggestedAmounts = suggestedAmounts {
            let prefix = endpoint.contains("=") ? "&" : "?"
            endpoint.append("\(prefix)suggestedAmounts=\(suggestedAmounts)")
        }
        NetworkManager.shared.dataTask(serviceURL: endpoint, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<OperatorDetails, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func getOperatorByCountry(country: String,
                                 suggestedAmounts: Bool? = nil,
                                 suggestedAmountsMap: Bool? = nil,
                                 includeBundles: Bool? = nil,
                                 simplified: Bool? = nil,
                                 includePin: Bool? = nil,
                                 includeData: Bool? = nil,
                                 completionHandler: @escaping (Result<[OperatorDetails], Error>) -> Void) {
        var endpoint = "/operators/countries/\(country)?"
        if let includeBundles = includeBundles {
            endpoint.append("&includeBundles=\(includeBundles)")
        }
        if let suggestedAmountsMap = suggestedAmountsMap {
            endpoint.append("&suggestedAmountsMap=\(suggestedAmountsMap)")
        }
        if let suggestedAmounts = suggestedAmounts {
            endpoint.append("&suggestedAmounts=\(suggestedAmounts)")
        }
        if let simplified = simplified {
            endpoint.append("&simplified=\(simplified)")
        }
        if let includePin = includePin {
            endpoint.append("&includePin=\(includePin)")
        }
        if let includeData = includeData {
            endpoint.append("&includeData=\(includeData)")
        }
        NetworkManager.shared.dataTask(serviceURL: endpoint, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<[OperatorDetails], Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func calculateFXRate(operatorId: Int, amount: Double, completionHandler: @escaping (Result<Fx, Error>) -> Void ) {
        
        NetworkManager.shared.dataTask(serviceURL: "/operators/fx-rate", httpMethod: .post, parameters: ["operatorId": operatorId, "amount": amount], proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<Fx, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

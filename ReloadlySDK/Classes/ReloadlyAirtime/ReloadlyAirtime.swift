//
//  ReloadlyAirtime.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation


public class ReloadlyAirtime {
       
    public static let shared = ReloadlyAirtime()
    
    public func getAccountBalance(completionHandler: @escaping (Result<Balance, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/accounts/balance", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let balance: Result<Balance, Error> = self.processSuccess(data: data)
                completionHandler(balance)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getCountryList(completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/countries", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let countryArray: Result<[Country], Error> = self.processSuccess(data: data)
                completionHandler(countryArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getCountryByCode(code: String, completionHandler: @escaping (Result<Country, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/countries/\(code)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let countryArray: Result<Country, Error> = self.processSuccess(data: data)
                completionHandler(countryArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getDiscountsList(page: Int = 1, size: Int = 20, completionHandler: @escaping (Result<Discounts, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/operators/commissions?page=\(page)&size=\(size)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<Discounts, Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getDiscountsByOperator(id: Int, completionHandler: @escaping (Result<Content, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/operators/\(id)/commissions", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<Content, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getTransactionsList(page: Int = 1,
                                    size: Int = 20,
                                    countryCode: String? = nil,
                                    operatorId: Int? = nil,
                                    operatorName: String? = nil,
                                    startDate: String? = nil,
                                    endDate: String? = nil,
                                    customIdentifier: String? = nil,
                                    completionHandler: @escaping (Result<Transactions, Error>) -> Void) {
        var endpoint = "/topups/reports/transactions?page=\(page)&size=\(size)"
        if let countryCode = countryCode {
            endpoint.append("&countryCode=\(countryCode)")
        }
        if let operatorId = operatorId {
            endpoint.append("&operatorId=\(operatorId)")
        }
        if let operatorName = operatorName {
            endpoint.append("&operatorName=\(operatorName)")
        }
        if let startDate = startDate {
            endpoint.append("&startDate=\(startDate)")
        }
        if let endDate = endDate {
            endpoint.append("&endDate=\(endDate)")
        }
        if let customIdentifier = customIdentifier {
            endpoint.append("&customIdentifier=\(customIdentifier)")
        }
        NetworkManager.shared.dataTask(serviceURL: endpoint, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<Transactions, Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func getTransactionById(id: Int, completionHandler: @escaping (Result<Content, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/topups/reports/transactions/\(id)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<Content, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func sendTopupsRequest(operatorId: Int,
                           amount: Double,
                           useLocalAmount: Bool? = nil,
                           customIdentifier: String? = nil,
                           recipientPhone: Phone? = nil,
                           recipientEmail: String? = nil,
                           senderPhone: Phone? = nil,
                           completionHandler: @escaping (Result<Topups, Error>) -> Void) {
        var parameters = ["operatorId": operatorId,
                          "amount": amount,
        ] as [String : Any]
        if let customIdentifier = customIdentifier {
            parameters.updateValue(customIdentifier, forKey: "customIdentifier")
        }
        if let recipient = recipientPhone {
            let recipientParams = ["countryCode": recipient.countryCode,
                                   "number": recipient.number]
            parameters.updateValue(recipientParams, forKey: "recipientPhone")
        }
        if let email = recipientEmail {
            parameters.updateValue(email, forKey: "recipientEmail")
        }
        if let sender = recipientPhone {
            let senderParams = ["countryCode": sender.countryCode,
                                   "number": sender.number]
            parameters.updateValue(senderParams, forKey: "senderPhone")
        }
        NetworkManager.shared.dataTask(serviceURL: "/topups", httpMethod: .post, parameters: parameters, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discount: Result<Topups, Error> = self.processSuccess(data: data)
                completionHandler(discount)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    
    }
    
}

extension ReloadlyAirtime {
    func processSuccess<T: Codable>(data: Data) -> Result<T, Error> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            ReloadlyAuthentication.shared.logger.debug("Receive model: \(model)")
            return .success(model)
        } catch let error {
            if let serverError: ErrorModel = try? JSONDecoder().decode(ErrorModel.self, from: data) {
                ReloadlyAuthentication.shared.logger.error("\(serverError)")
                return.failure(ServiceError.unableToProcesRequest(message: serverError.message))
            } else {
                ReloadlyAuthentication.shared.logger.error("\(error)")
                return.failure(error)
            }
        }
    }
}

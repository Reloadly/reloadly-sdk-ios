//
//  ReloadlyGiftcard.swift
//  ReloadlySDK
//
//  Created by Tarik on 21.11.2021.
//

import Foundation

public class ReloadlyGiftcard {
       
    public static let shared = ReloadlyGiftcard()
    
    public func getAllProducts(includeRange: Bool = false, includeFixed: Bool = false, completionHandler: @escaping (Result<Products, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/products?includeRange=\(includeRange)&includeFixed=\(includeFixed)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):    
                let result: Result<Products, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getProduct(by id: Int, completionHandler: @escaping (Result<ProductContent, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/products/\(id)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<ProductContent, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getProductByISO(countryCode: String, completionHandler: @escaping (Result<Products, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/countries/\(countryCode)/products", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Products, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func redeemInstruction(completionHandler: @escaping (Result<[Brand], Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/redeem-instructions", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<[Brand], Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func redeemInstruction(by id: Int, completionHandler: @escaping (Result<Brand, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/brands/\(id)/redeem-instructions", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Brand, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func discounts(page: Int = 1, size: Int = 50, completionHandler: @escaping (Result<Discounts, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/discounts?page=\(page)&size=\(size)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Discounts, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func discounts(by productId: Int, completionHandler: @escaping (Result<Discount, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/products/\(productId)/discounts", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Discount, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    public func allTransactions(completionHandler: @escaping (Result<Transactions, Error>) -> Void) {
        let url = "/reports/transactions"
        NetworkManager.shared.dataTask(serviceURL: url, httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Transactions, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func transaction(by id: Int, completionHandler: @escaping (Result<Topups, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/reports/transactions/\(id)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<Topups, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func orderGiftcard(with productId: Int,
                              countryCode: String,
                              quantity: Int,
                              unitPrice: Double,
                              customIdentifier: String,
                              senderName: String,
                              recipientEmail: String? = nil,
                              recipientPhoneDetails: RecipientPhoneDetailsModel? = nil,
                              completionHandler: @escaping (Result<OrderGiftcard, Error>) -> Void) {
        var parameters: [String: Any] = [
                "productId": productId,
                "countryCode": countryCode,
                "quantity": quantity,
                "unitPrice": unitPrice,
                "customIdentifier": customIdentifier,
                "senderName": senderName]
        if let recipientEmail = recipientEmail {
            parameters.updateValue(recipientEmail, forKey: "recipientEmail")
        }
        
        if let recipientPhoneDetails = recipientPhoneDetails,
            let countryCode = recipientPhoneDetails.countryCode,
            let phone = recipientPhoneDetails.phoneNumber {
            let value = ["countryCode": countryCode,
                         "phoneNumber": phone
                        ]
            parameters.updateValue(value, forKey: "recipientPhoneDetails")
        }
        
        if recipientEmail == nil && recipientPhoneDetails == nil {
            completionHandler(.failure(ServiceError.unableToProcesRequest(message: "recipientPhoneDetails or recipientEmail should be filled")))
            return
        }
        
        NetworkManager.shared.dataTask(serviceURL: "/orders", httpMethod: .post, parameters: parameters, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<OrderGiftcard, Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func redeemCode(by transactionId: Int, completionHandler: @escaping (Result<[RedeemCode], Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/orders/transactions/\(transactionId)/cards", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let result: Result<[RedeemCode], Error> = self.processSuccess(data: data)
                completionHandler(result)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

extension ReloadlyGiftcard {
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

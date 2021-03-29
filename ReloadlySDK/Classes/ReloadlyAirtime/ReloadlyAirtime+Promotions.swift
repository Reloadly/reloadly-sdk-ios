//
//  ReloadlyAirtime+Promotions.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 17.03.2021.
//

import Foundation

extension ReloadlyAirtime {

    public func getPromotionsList(page: Int = 1, size: Int = 20, completionHandler: @escaping (Result<PromotionArray, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/promotions?page=\(page)&size=\(size)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<PromotionArray, Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getPromotionsById(Id: Int, completionHandler: @escaping (Result<Promotion, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/promotions/\(Id)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<Promotion, Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func getPromotionsByCountryCode(countryCode: String, completionHandler: @escaping (Result<[Promotion], Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/promotions/country-codes/\(countryCode)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<[Promotion], Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func getPromotionsByOperatorId(id: String, completionHandler: @escaping (Result<Discounts, Error>) -> Void) {
        NetworkManager.shared.dataTask(serviceURL: "/promotions/operators/\(id)", httpMethod: .get, parameters: nil, proxyConfigurator: ReloadlyAuthentication.shared.proxyConfiguration) { result in
            switch result {
            case .success(let data):
                let discountsArray: Result<Discounts, Error> = self.processSuccess(data: data)
                completionHandler(discountsArray)
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

//
//  ReloadlyAirtimeTest.swift
//  ReloadlyAuthentication_Tests
//
//  Created by Taras Markevych on 18.03.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import ReloadlySDK

class ReloadlyAirtimeTest: XCTestCase {

    override func setUp() {
        super.setUp()
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
    }
    
    func testGetBalance() {
        ReloadlyAirtime.shared.getAccountBalance() { result in
            XCTAssertNotNil(result)
        }
    }
    
    
    func testGetCountryList() {
        ReloadlyAirtime.shared.getCountryList() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetPromotionsList() {
        ReloadlyAirtime.shared.getPromotionsList(page: 1, size: 2) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetPromotionsById() {
        ReloadlyAirtime.shared.getPromotionsById(Id: 701) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetPromotionsByOperatorId() {
        ReloadlyAirtime.shared.getPromotionsByOperatorId(id: "1") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetPromotionsByCountryCode() {
        ReloadlyAirtime.shared.getPromotionsByCountryCode(countryCode: "US") { result in
            XCTAssertNotNil(result)
        }
    }
    
    
    func testGetDiscountsList() {
        ReloadlyAirtime.shared.getDiscountsList(page: 1, size: 3) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetDiscountsByOperator() {
        ReloadlyAirtime.shared.getDiscountsByOperator(id: 701) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetTransactionsList() {
        ReloadlyAirtime.shared.getTransactionsList(page: 1, size: 4, countryCode: "UA", operatorId: 701, operatorName: "test", startDate: "2020-12-12", endDate: "2021-12-12", customIdentifier: "test") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetTransactionById() {
        ReloadlyAirtime.shared.getTransactionById(id: 1)  { result in
            XCTAssertNotNil(result)
        }
    }

    
    func testGetOperatorsList() {
        ReloadlyAirtime.shared.getOperatorsList(page: 1, size: 2, suggestedAmounts: false, suggestedAmountsMap: false, includeBundles: false, simplified: false, includePin: false, includeData: false)  { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetOperatorById() {
        ReloadlyAirtime.shared.getOperatorById(id: 1)  { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetOperatorByCountry() {
        ReloadlyAirtime.shared.getOperatorByCountry(country: "US")  { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetOperatorForPhone() {
        ReloadlyAirtime.shared.getOperatorForPhone(phone: "+380937431520", countryCode: "UA", suggestedAmounts: true, suggestedAmountsMap: true)  { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetCountryByCode() {
        ReloadlyAirtime.shared.getCountryByCode(code: "US")  { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testsendTopups() {
        let sender = Phone(number: "123567890", countryCode: "UA")
        ReloadlyAirtime.shared.sendTopupsRequest(operatorId: 701, amount: 1.0, senderPhone: sender) { result in
            XCTAssertNotNil(result)
        }
    }
    
    
    func testRequestWithProxy() {
        let proxy = ProxyConfigurator(hostUrl: "localhost", port: 80, username: "username", password: "password")
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox), proxyConfiguration: proxy)
        ReloadlyAirtime.shared.getAccountBalance() { result in
            XCTAssertNotNil(result)
        }
    }

}

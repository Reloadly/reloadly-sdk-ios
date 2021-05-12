//
//  ReloadlyAirtimeTest.swift
//  ReloadlyAuthentication_Tests
//
//  Created by Taras Markevych on 18.03.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import ReloadlySDK

class ReloadlyAirtimeTest: XCTestCase {

    override func setUp() {
        super.setUp()
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            XCTAssertNotNil(result)
        }
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
        ReloadlyAirtime.shared.sendTopupsRequest(operatorId: 701, amount: 1.0, customIdentifier: "id",  recipientPhone: sender, recipientEmail: "mail@mail.com", senderPhone: sender) { result in
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

    
    func testNotExpiredToken() {
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
        ReloadlyAuthentication.shared.requestAccessToken(completionHandler: { result in
            XCTAssertNotNil(result)
        })
    }
    
    func testEmptyToken() {
        ReloadlyAuthentication.shared.configure(with: "",
                                                clientSecret: "",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
        ReloadlyAuthentication.shared.requestAccessToken(completionHandler: { result in
            XCTAssertNotNil(result)
        })
    }
    
    func testPromoModels() {
        let promo = Promotion(promotionId: 9, operatorId: 2, title: "Text", title2: "Text", contentDescription: "Text", startDate: "12-12-2021", endDate: "12-12-2021", denominations: "Text", localDenominations: "Text")
        XCTAssertEqual(9, promo.promotionId)
    }
    
    func testTopupsModels() {
        let topups = Topups(transactionId: 23, operatorTransactionId: 23, customIdentifier: "id", recipientPhone: "380932235312", senderPhone: "+12345432", countryCode: "US", operatorId: nil, operatorName: nil, discount: nil, discountCurrencyCode: nil, requestedAmount: nil, requestedAmountCurrencyCode: nil, deliveredAmount: nil, deliveredAmountCurrencyCode: nil, transactionDate: nil, pinDetail: PinDetail(serial: "342e2", info1: "", info2: nil, info3: nil, code: nil, ivr: nil, validity: nil))
        XCTAssertEqual(23, topups.transactionId)
        XCTAssertNotNil(topups.pinDetail)
    }
    
    
    func testOperatorModels() {
        let operatorModel = Operator(id: 23, operatorId: 34, name: "Test", countryCode: "US", data: false, bundle: nil, status: nil)
        XCTAssertEqual(23, operatorModel.id)
    }
    
    func testOperatorArray() {
        let operatorModel = OperatorArray(content: [OperatorDetails(id: 24, operatorId: 24, name: "Test", bundle: false, data: false, pin: false, supportsLocalAmounts: false, denominationType: "Test", senderCurrencyCode: "US", senderCurrencySymbol: "$", destinationCurrencyCode: "Dol", destinationCurrencySymbol: "$", commission: 1.0, internationalDiscount:  1.0, localDiscount:  1.0, mostPopularAmount:  1.0, mostPopularLocalAmount:  1.0, minAmount:  1.0, maxAmount:  1.0, localMinAmount: 3.2, localMaxAmount:  1.0, country: CountryOperator(isoName: "US", name: "US"), fx: Fx(rate: 1.0, currencyCode: "USD", id: 1, fxRate: 1.0, name: "USD"), logoUrls: [], fixedAmounts: [])], pageable: Pageable(sort: Sort(unsorted: false, sorted: false, empty: false), pageNumber: 1, pageSize: 2, offset: 2, unpaged: false, paged: false), totalElements: 3, totalPages: 4, last: false, sort: Sort(unsorted: false, sorted: false, empty: false), first: false, numberOfElements: 4, size: 4, number: 4, empty: false)
        XCTAssertEqual(24, operatorModel.content.first?.id)
    }
    
    
    func testEnvironment() {
        let service = AuthenticationService(backendEnvironment: .production)
        service.backendEnvironment = .sandbox
        XCTAssertNotNil(service)
    }
    
    func testParcer() {
        let discountsArray: Result<Operator, Error> = ReloadlyAirtime.shared.processSuccess(data: Data())
        XCTAssertNotNil(discountsArray)
    }
    
    
    func testPromotionArray() {
        let promo = Promotion(promotionId: 9, operatorId: 2, title: "Text", title2: "Text", contentDescription: "Text", startDate: "12-12-2021", endDate: "12-12-2021", denominations: "Text", localDenominations: "Text")
        let promArray = PromotionArray(content: [promo], pageable: Pageable(sort: Sort(unsorted: false, sorted: false, empty: false), pageNumber: 1, pageSize: 2, offset: 2, unpaged: false, paged: false), totalPages: 3, totalElements: 1, last: false, sort: Sort(unsorted: false, sorted: false, empty: false), first: false, numberOfElements: 3, size: 3, number: 3)
        XCTAssertEqual(9, promArray.content.first?.promotionId)

    }
    
    func testKeychain() {
        let keychain = Keychain()
        let uuid = UUID().uuidString
        let getValue = keychain.get(key: uuid)
        XCTAssertNil(getValue)
        let token = OAuth2Token(accessToken: "", scope: "test", expiresIn: 23424, tokenType: "Bearer", date: Date())
        keychain.set(value: token, key: uuid)
        let getKey = keychain.get(key: uuid)
        keychain.set(value: token, key: uuid)
        XCTAssertTrue(token.isValid)
        XCTAssertNotNil(getKey)
    }
    
    
    func testDiscountsModel() {
        let discount = Discounts(content: [Content(percentage: 2.2, internationalPercentage: 23.21, localPercentage: 13.1, updatedAt: nil, contentOperator: nil)], pageable: Pageable(sort: Sort(unsorted: false, sorted: false, empty: false), pageNumber: 1, pageSize: 2, offset: 2, unpaged: false, paged: false), totalElements: 1, totalPages: 3, last: false, sort: Sort(unsorted: false, sorted: false, empty: false), first: false, numberOfElements: 3, size: 3, number: 3, empty: false)
        XCTAssertEqual(2.2, discount.content.first?.percentage)
    }
    
    func testTransactionModel() {
        let transaction = Transactions(content: [], pageable: Pageable(sort: Sort(unsorted: false, sorted: false, empty: false), pageNumber: 1, pageSize: 2, offset: 2, unpaged: false, paged: false), totalElements: 1, totalPages: 3, last: false, sort: Sort(unsorted: false, sorted: false, empty: false), first: false, numberOfElements: 3, size: 3, number: 3, empty: false)
        XCTAssertEqual(0, transaction.content.count)

    }
    
    
    func testFormatter() {
        let logger = Logger(formatter: .detailed, minLevel: .trace)
        logger.warning("print", separator: "-", terminator: "|")
        XCTAssertNotEqual("",  logger.format.description)
        XCTAssertEqual(0, logger.minLevel.rawValue)
    }
    
    func testRequestAuth() {
        ReloadlyAuthentication.shared.configure(with: "NxhvFxDrXtX34VL1DLHsbQGLOPgE8qL9",
                                                clientSecret: "c7gcNR4dOIAlmalojV35okbq--tqqVhPPr2bvcsXlmKadewvaXdRSxENwfpyFywh",
                                                service: AuthenticationService(backendEnvironment: .sandbox))
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            XCTAssertNotNil(result)
        }
    }
}

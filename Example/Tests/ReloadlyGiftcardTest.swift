//
//  ReloadlyGiftcardTest.swift
//  ReloadlyAuthentication_Tests
//
//  Created by Tarik on 22.11.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import ReloadlySDK


class ReloadlyGiftcardTest: XCTestCase {

    override func setUp() {
        super.setUp()
        ReloadlyAuthentication.shared.configure(with: "CnRq3ACS1AsOYb2hnW8iEAOZq09pEPOT",
                                                clientSecret: "0Q8t7n7chP-KESrM0Mauy6U3UmxGR9-ATE0k8CuLoSVk7cDF1Yz2pI7mAh5TcEg",
                                                service: AuthenticationService(backendEnvironment: .giftcardSandbox))
        ReloadlyAuthentication.shared.requestAccessToken() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetAllProducts() {
        ReloadlyGiftcard.shared.getAllProducts() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetAllProductsWithParams() {
        ReloadlyGiftcard.shared.getAllProducts(includeRange: true, includeFixed: true) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetAllProductsWithId() {
        ReloadlyGiftcard.shared.getProduct(by: 1) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testRedeemCodeWithId() {
        ReloadlyGiftcard.shared.redeemCode(by: 617) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testDiscounts() {
        ReloadlyGiftcard.shared.discounts() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testDiscountsById() {
        ReloadlyGiftcard.shared.discounts(by: 1) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testAllTransactions() {
        ReloadlyGiftcard.shared.allTransactions() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetProductByISO() {
        ReloadlyGiftcard.shared.getProductByISO() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testRedeemInstructionById() {
        ReloadlyGiftcard.shared.redeemInstruction(by: 1) { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testRedeemInstructions() {
        ReloadlyGiftcard.shared.redeemInstruction() { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testOrderGiftcard() {
        ReloadlyGiftcard.shared.orderGiftcard(with: 1, countryCode: "US", quantity: 1, unitPrice: 25.00, customIdentifier: "obucks10", senderName: "John Doe", recipientEmail: "anyone@email.com") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testModes() {
        let orderGiftcard = OrderGiftcard(transactionId: 1, amount: 1.2, discount: 12.1, currencyCode: "ds", fee: 12.12, recipientEmail: "sd", customIdentifier: "sd", status: "fsff", product: Discount(percentage: 1.1, internationalPercentage: 1.2, localPercentage: 32.2, updatedAt: "sdfs", contentOperator: Operator(id: 23, operatorId: 23, name: "sf", countryCode: "dsf", data: false, bundle: false, status: false)), transactionCreatedTime: "sdas")
        XCTAssertEqual(1, orderGiftcard.transactionId)
        let redeemCode = RedeemCode(cardNumber: "4343", pinCode: "1234")
        XCTAssertEqual("4343", redeemCode.cardNumber)
        let products = Products(content: [ProductContent](), pageable: nil, last: nil, totalPages: nil, totalElements: nil, first: nil, sort: nil, numberOfElements: nil, size: nil, number: nil, empty: nil)
        XCTAssertEqual(0, products.content?.count)
    }
    
}

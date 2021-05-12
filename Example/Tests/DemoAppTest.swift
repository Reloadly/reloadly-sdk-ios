//
//  DemoAppTest.swift
//  ReloadlyAuthentication_Tests
//
//  Created by Taras Markevych on 19.03.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import ReloadlyAuthentication_Example

class DemoAppTest: XCTestCase {
    
    var viewController: ViewController?

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController = vc
    }
    
    func testSelectedItems() {
        for i in 0..<6 {
            viewController?.selectItemAt(index: i)
            XCTAssertLessThanOrEqual(i, 6, "Success")
        }
    }
    
    func testShowAlert() {
        viewController?.showAlert(title: "test", message: nil)
        XCTAssertNotNil(viewController)
    }
    
    func testProcessSuccess() {
        viewController?.process(result: .success(Data()))
        XCTAssertNotNil(viewController)
    }
    
    func testDidSelect() {
        for i in 0...6 {
            viewController!.tableView(viewController!.tableView, didSelectRowAt: IndexPath(row: i, section: 0))
        }
        XCTAssertNotNil(viewController)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

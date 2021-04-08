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
    
    override func tearDown() {
        super.tearDown()
    }
    
    func checkActionForOutlet(outlet: UIButton?, actionName: String, event: UIControl.Event, controller: UIViewController) -> Bool {
        if let unwrappedButton = outlet {
            let actions: [String] = unwrappedButton.actions(forTarget: controller, forControlEvent: event)!
            return(actions.contains(actionName))
        }
        return false
    }    
}

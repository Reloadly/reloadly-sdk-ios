//
//  ViewController.swift
//  ReloadlyAuthentication
//
//  Created by 4taras4 on 03/15/2021.
//  Copyright (c) 2021 4taras4. All rights reserved.
//

import UIKit
import ReloadlySDK

class ViewController: UIViewController {

    @IBAction func authAction() {
        getBalance()
    }
    
    @IBOutlet var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getBalance() {
        ReloadlyAirtime.shared.sendTopupsRequest(operatorId: 701, amount: 1.0, useLocalAmount: true, customIdentifier: "customID", recipientEmail: "mail@mail.com", senderPhone: Phone(number: "+13059547862", countryCode: "US")) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
}


//
//  AuthenticationBackendEnvironment.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation
import Foundation

public enum AuthenticationBackendEnvironment: String {
    case airtimeProduction
    case airtimeSandbox
    case giftcardProduction
    case giftcardSandbox

    var baseURL: String {
        let environment = ReloadlyAuthentication.shared.service.backendEnvironment
        switch environment {
            case .airtimeProduction:  return "https://topups.reloadly.com"
            case .airtimeSandbox: return "https://topups-sandbox.reloadly.com"
            case .giftcardProduction: return "https://giftcards.reloadly.com"
            case .giftcardSandbox: return "https://giftcards-sandbox.reloadly.com"
        }
    }
    
    var authURL: String {
        let environment = ReloadlyAuthentication.shared.service.backendEnvironment
        switch environment {
            case .airtimeSandbox, .airtimeProduction: return "https://auth.reloadly.com"
            case .giftcardSandbox, .giftcardProduction: return "https://auth.reloadly.com"
        }
    }
}

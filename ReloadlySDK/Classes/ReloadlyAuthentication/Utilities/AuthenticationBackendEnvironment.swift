//
//  AuthenticationBackendEnvironment.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation
import Foundation

public enum AuthenticationBackendEnvironment: String {
    case production
    case sandbox

    var baseURL: String {
        let environment = ReloadlyAuthentication.shared.service.backendEnvironment
        switch environment {
            case .production:  return "https://topups.reloadly.com"
            case .sandbox: return "https://topups-sandbox.reloadly.com"
        }
    }
}

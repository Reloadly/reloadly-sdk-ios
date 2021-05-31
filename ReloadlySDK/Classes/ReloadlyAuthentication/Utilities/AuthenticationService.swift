//
//  AuthenticationEnvironment.swift
//  reloadly-authentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public let environmentUpdateNotificationName = Notification.Name("com.reloadly.Authentication.environmentUpdateNotification")

public protocol AuthenticationServiceProtocol {
    var backendEnvironment: AuthenticationBackendEnvironment { get set }
}

public final class AuthenticationService: AuthenticationServiceProtocol {

    public var backendEnvironment: AuthenticationBackendEnvironment {
        didSet {
            notifyAboutUpdate()
        }
    }

    public init(backendEnvironment: AuthenticationBackendEnvironment) {
        self.backendEnvironment = backendEnvironment
    }
    
    public init(backendEnvironment: String) {
        self.backendEnvironment = AuthenticationBackendEnvironment(rawValue: backendEnvironment) ?? .sandbox
    }

    private func notifyAboutUpdate() {
        NotificationCenter.default.post(name: environmentUpdateNotificationName, object: nil, userInfo: nil)
    }

}




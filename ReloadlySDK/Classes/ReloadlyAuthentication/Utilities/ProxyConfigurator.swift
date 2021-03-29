//
//  ProxyConfigurator.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public struct ProxyConfigurator {
    public let username: String?
    public let password: String?
    public let hostUrl: String
    public let port: Int
    
    public init(hostUrl: String, port: Int, username: String? = nil, password: String? = nil) {
        self.hostUrl = hostUrl
        self.port = port
        self.username = username
        self.password = password
    }

}

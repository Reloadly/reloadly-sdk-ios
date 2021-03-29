//
//  OAuth2Token.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public struct OAuth2Token: Codable {
  
    public var accessToken: String // access token
    public var scope: String
    public var expiresIn: Int // seconds until token expires
    public var tokenType: String // for example "Bearer"
      
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case scope
        case tokenType = "token_type"
        case date
    }
    
    // returns if token is still valid or has expired
    public var date: Date? // date when the token was initialized
      
    public var isValid: Bool {
        let now = Date()
        let seconds = TimeInterval(expiresIn)
        return now.timeIntervalSince(date ?? Date()) < seconds
    }
}

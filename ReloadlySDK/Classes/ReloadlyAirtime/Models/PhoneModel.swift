//
//  Phone.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 17.03.2021.
//

import Foundation

public struct Phone {
    public let countryCode: String
    public let number: String
    
    public init(number: String, countryCode: String) {
        self.number = number
        self.countryCode = countryCode
    }
}


//
//  CountryModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public struct Country: Codable {
    public var isoName: String
    public var name: String
    public var currencyCode: String
    public var currencyName: String
    public var currencySymbol: String
    public var flag: String
    public var callingCodes: [String]

}

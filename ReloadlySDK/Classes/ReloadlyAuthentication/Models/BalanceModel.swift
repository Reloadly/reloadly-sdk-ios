//
//  BalanceModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

public struct Balance: Codable {
    public var balance: Double
    public var currencyCode: String
    public var currencyName: String?
    public var updatedAt: String?
}

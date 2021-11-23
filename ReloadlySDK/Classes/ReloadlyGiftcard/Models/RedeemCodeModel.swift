//
//  RedeemCodeModel.swift
//  ReloadlySDK
//
//  Created by Tarik on 22.11.2021.
//

import Foundation

public struct RedeemCode: Codable {
    public let cardNumber: String?
    public let pinCode: String?

    public init(cardNumber: String?, pinCode: String?) {
        self.cardNumber = cardNumber
        self.pinCode = pinCode
    }
}

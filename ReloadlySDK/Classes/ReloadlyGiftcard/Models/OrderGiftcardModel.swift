//
//  OrderGiftcard.swift
//  ReloadlySDK
//
//  Created by Tarik on 22.11.2021.
//

import Foundation

public struct OrderGiftcard: Codable {
    public let transactionId: Int?
    public let amount: Double?
    public let discount: Double?
    public let currencyCode: String?
    public let fee: Double?
    public let recipientEmail: String?
    public let customIdentifier: String?
    public let status: String?
    public let product: Discount?
    public let transactionCreatedTime: String?

    public init(transactionId: Int?, amount: Double?, discount: Double?, currencyCode: String?, fee: Double?, recipientEmail: String?, customIdentifier: String?, status: String?, product: Discount?, transactionCreatedTime: String?) {
        self.transactionId = transactionId
        self.amount = amount
        self.discount = discount
        self.currencyCode = currencyCode
        self.fee = fee
        self.recipientEmail = recipientEmail
        self.customIdentifier = customIdentifier
        self.status = status
        self.product = product
        self.transactionCreatedTime = transactionCreatedTime
    }
}

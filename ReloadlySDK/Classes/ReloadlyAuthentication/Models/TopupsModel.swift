//
//  TopupsModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 17.03.2021.
//

import Foundation
public struct Topups: Codable {
    public let transactionId: Int?
    public let operatorTransactionId: Int?
    public let customIdentifier: String?
    public let recipientPhone: String?
    public let senderPhone: String?
    public let countryCode: String?
    public let operatorId: Int?
    public let operatorName: String?
    public let discount: Double?
    public let discountCurrencyCode: String?
    public let requestedAmount: Double?
    public let requestedAmountCurrencyCode: String?
    public let deliveredAmount: Double?
    public let deliveredAmountCurrencyCode: String?
    public let transactionDate: String?
    public let pinDetail: PinDetail?

    public init(transactionId: Int?, operatorTransactionId: Int?, customIdentifier: String?, recipientPhone: String?, senderPhone: String?, countryCode: String?, operatorId: Int?, operatorName: String?, discount: Double?, discountCurrencyCode: String?, requestedAmount: Double?, requestedAmountCurrencyCode: String?, deliveredAmount: Double?, deliveredAmountCurrencyCode: String?, transactionDate: String?, pinDetail: PinDetail?) {
        self.transactionId = transactionId
        self.operatorTransactionId = operatorTransactionId
        self.customIdentifier = customIdentifier
        self.recipientPhone = recipientPhone
        self.senderPhone = senderPhone
        self.countryCode = countryCode
        self.operatorId = operatorId
        self.operatorName = operatorName
        self.discount = discount
        self.discountCurrencyCode = discountCurrencyCode
        self.requestedAmount = requestedAmount
        self.requestedAmountCurrencyCode = requestedAmountCurrencyCode
        self.deliveredAmount = deliveredAmount
        self.deliveredAmountCurrencyCode = deliveredAmountCurrencyCode
        self.transactionDate = transactionDate
        self.pinDetail = pinDetail
    }
}

// MARK: - PinDetail
public struct PinDetail: Codable {
    public let serial: String?
    public let info1: String?
    public let info2: String?
    public let info3: String?
    public let code: String?
    public let ivr: String?
    public let validity: String?

    public init(serial: String?, info1: String?, info2: String?, info3: String?, code: String?, ivr: String?, validity: String?) {
        self.serial = serial
        self.info1 = info1
        self.info2 = info2
        self.info3 = info3
        self.code = code
        self.ivr = ivr
        self.validity = validity
    }
}

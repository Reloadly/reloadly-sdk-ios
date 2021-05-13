//
//  OperatorModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 16.03.2021.
//

import Foundation

import Foundation

// MARK: - OperatorArray
public struct OperatorArray: Codable {
    public let content: [OperatorDetails]
    public let pageable: Pageable
    public let totalElements: Int
    public let totalPages: Int
    public let last: Bool
    public let sort: Sort
    public let first: Bool
    public let numberOfElements: Int
    public let size: Int
    public let number: Int
    public let empty: Bool

    public init(content: [OperatorDetails], pageable: Pageable, totalElements: Int, totalPages: Int, last: Bool, sort: Sort, first: Bool, numberOfElements: Int, size: Int, number: Int, empty: Bool) {
        self.content = content
        self.pageable = pageable
        self.totalElements = totalElements
        self.totalPages = totalPages
        self.last = last
        self.sort = sort
        self.first = first
        self.numberOfElements = numberOfElements
        self.size = size
        self.number = number
        self.empty = empty
    }
}

// MARK: - OperatorDetails
public struct OperatorDetails: Codable {
    public let id: Int
    public let operatorId: Int
    public let name: String?
    public let bundle: Bool?
    public let data: Bool?
    public let pin: Bool?
    public let supportsLocalAmounts: Bool?
    public let denominationType: String?
    public let senderCurrencyCode: String?
    public let senderCurrencySymbol: String?
    public let destinationCurrencyCode: String?
    public let destinationCurrencySymbol: String?
    public let commission: Double?
    public let internationalDiscount: Double?
    public let localDiscount: Double?
    public let mostPopularAmount: Double?
    public let mostPopularLocalAmount: Double?
    public let minAmount: Double?
    public let maxAmount: Double?
    public let localMinAmount: Double?
    public let localMaxAmount: Double?
    public let country: CountryOperator?
    public let fx: Fx?
    public let logoUrls: [String]?
    public let fixedAmounts: [Double]?
    public let geographicalRechargePlans: [GeographicalRechargePlan]?

    public init(id: Int, operatorId: Int, name: String?, bundle: Bool?, data: Bool?, pin: Bool?, supportsLocalAmounts: Bool?, denominationType: String?, senderCurrencyCode: String?, senderCurrencySymbol: String?, destinationCurrencyCode: String?, destinationCurrencySymbol: String?, commission: Double?, internationalDiscount: Double?, localDiscount: Double, mostPopularAmount: Double?, mostPopularLocalAmount: Double?, minAmount: Double?, maxAmount: Double?, localMinAmount: Double?, localMaxAmount: Double?, country: CountryOperator?, fx: Fx?, logoUrls: [String]?, fixedAmounts: [Double]?, geographicalRechargePlans: [GeographicalRechargePlan]?) {
        self.id = id
        self.operatorId = operatorId
        self.name = name
        self.bundle = bundle
        self.data = data
        self.pin = pin
        self.supportsLocalAmounts = supportsLocalAmounts
        self.denominationType = denominationType
        self.senderCurrencyCode = senderCurrencyCode
        self.senderCurrencySymbol = senderCurrencySymbol
        self.destinationCurrencyCode = destinationCurrencyCode
        self.destinationCurrencySymbol = destinationCurrencySymbol
        self.commission = commission
        self.internationalDiscount = internationalDiscount
        self.localDiscount = localDiscount
        self.mostPopularAmount = mostPopularAmount
        self.mostPopularLocalAmount = mostPopularLocalAmount
        self.minAmount = minAmount
        self.maxAmount = maxAmount
        self.localMinAmount = localMinAmount
        self.localMaxAmount = localMaxAmount
        self.country = country
        self.fx = fx
        self.logoUrls = logoUrls
        self.fixedAmounts = fixedAmounts
        self.geographicalRechargePlans = geographicalRechargePlans
    }
}

// MARK: - Country
public struct CountryOperator: Codable {
    public let isoName: String
    public let name: String

    public init(isoName: String, name: String) {
        self.isoName = isoName
        self.name = name
    }
}

// MARK: - Fx
public struct Fx: Codable {
    public let id: Int?
    public let rate: Double?
    public let name: String?
    public let fxRate: Double?
    public let currencyCode: String?

    public init(rate: Double?, currencyCode: String?, id: Int?, fxRate: Double?, name: String?) {
        self.rate = rate
        self.currencyCode = currencyCode
        self.id = id
        self.fxRate = fxRate
        self.name = name
    }
}


// MARK: - GeographicalRechargePlan
public struct GeographicalRechargePlan: Codable {
    public let locationCode: String?
    public let locationName: String?
    public let fixedAmounts: [Double]?
    public let localAmounts: [Int]?
    public let fixedAmountsDescriptions: Dictionary<String, String>?
    public let localFixedAmountsDescriptions: Dictionary<String, String>?

    public init(locationCode: String?, locationName: String?, fixedAmounts: [Double]?, localAmounts: [Int]?, fixedAmountsDescriptions: Dictionary<String, String>?, localFixedAmountsDescriptions: Dictionary<String, String>?) {
        self.locationCode = locationCode
        self.locationName = locationName
        self.fixedAmounts = fixedAmounts
        self.localAmounts = localAmounts
        self.fixedAmountsDescriptions = fixedAmountsDescriptions
        self.localFixedAmountsDescriptions = localFixedAmountsDescriptions
    }
}

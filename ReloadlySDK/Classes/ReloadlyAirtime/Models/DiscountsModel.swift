//
//  DiscountsModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 16.03.2021.
//

import Foundation

// MARK: - Discounts
public struct Discounts: Codable {
    public let content: [Content]
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

    public init(content: [Content], pageable: Pageable, totalElements: Int, totalPages: Int, last: Bool, sort: Sort, first: Bool, numberOfElements: Int, size: Int, number: Int, empty: Bool) {
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

// MARK: - Content
public struct Content: Codable {
    public let percentage: Double
    public let internationalPercentage: Double
    public let localPercentage: Double
    public let updatedAt: String
    public let `operator`: Operator

    public init(percentage: Double, internationalPercentage: Double, localPercentage: Double, updatedAt: String, contentOperator: Operator) {
        self.percentage = percentage
        self.internationalPercentage = internationalPercentage
        self.localPercentage = localPercentage
        self.updatedAt = updatedAt
        self.operator = contentOperator
    }
}

// MARK: - Operator
public struct Operator: Codable {
    public let id: Int
    public let operatorId: Int
    public let name: String
    public let countryCode: String
    public let data: Bool
    public let bundle: Bool
    public let status: Bool

    public init(id: Int, operatorId: Int, name: String, countryCode: String, data: Bool, bundle: Bool, status: Bool) {
        self.id = id
        self.operatorId = operatorId
        self.name = name
        self.countryCode = countryCode
        self.data = data
        self.bundle = bundle
        self.status = status
    }
}

// MARK: - Pageable
public struct Pageable: Codable {
    public let sort: Sort
    public let pageNumber: Int
    public let pageSize: Int
    public let offset: Int
    public let unpaged: Bool
    public let paged: Bool

    public init(sort: Sort, pageNumber: Int, pageSize: Int, offset: Int, unpaged: Bool, paged: Bool) {
        self.sort = sort
        self.pageNumber = pageNumber
        self.pageSize = pageSize
        self.offset = offset
        self.unpaged = unpaged
        self.paged = paged
    }
}

// MARK: - Sort
public struct Sort: Codable {
    public let unsorted: Bool
    public let sorted: Bool
    public let empty: Bool

    public init(unsorted: Bool, sorted: Bool, empty: Bool) {
        self.unsorted = unsorted
        self.sorted = sorted
        self.empty = empty
    }
}

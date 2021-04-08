//
//  PromotionModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 17.03.2021.
//

import Foundation

public struct PromotionArray: Codable {
    public let content: [Promotion]
    public let pageable: Pageable
    public let totalPages: Int
    public let totalElements: Int
    public let last: Bool
    public let sort: Sort
    public let first: Bool
    public let numberOfElements: Int
    public let size: Int
    public let number: Int

    public init(content: [Promotion], pageable: Pageable, totalPages: Int, totalElements: Int, last: Bool, sort: Sort, first: Bool, numberOfElements: Int, size: Int, number: Int) {
        self.content = content
        self.pageable = pageable
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.last = last
        self.sort = sort
        self.first = first
        self.numberOfElements = numberOfElements
        self.size = size
        self.number = number
    }
}

// MARK: - Content
public struct Promotion: Codable {
    public let promotionId: Int
    public let operatorId: Int
    public let title: String?
    public let title2: String?
    public let contentDescription: String?
    public let startDate: String?
    public let endDate: String?
    public let denominations: String?
    public let localDenominations: String?

    public init(promotionId: Int, operatorId: Int, title: String?, title2: String?, contentDescription: String?, startDate: String?, endDate: String?, denominations: String?, localDenominations: String?) {
        self.promotionId = promotionId
        self.operatorId = operatorId
        self.title = title
        self.title2 = title2
        self.contentDescription = contentDescription
        self.startDate = startDate
        self.endDate = endDate
        self.denominations = denominations
        self.localDenominations = localDenominations
    }
}

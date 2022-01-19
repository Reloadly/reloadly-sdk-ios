//
//  SortModel.swift
//  ReloadlySDK
//
//  Created by Tarik on 13.01.2022.
//

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

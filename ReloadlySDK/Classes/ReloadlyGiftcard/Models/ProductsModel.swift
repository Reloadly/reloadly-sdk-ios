import Foundation

// MARK: - Products
public struct Products: Codable {
    public let content: [ProductContent]?
    public let pageable: Pageable?
    public let last: Bool?
    public let totalPages: Int?
    public let totalElements: Int?
    public let first: Bool?
    public let sort: Sort?
    public let numberOfElements: Int?
    public let size: Int?
    public let number: Int?
    public let empty: Bool?

    public init(content: [ProductContent]?, pageable: Pageable?, last: Bool?, totalPages: Int?, totalElements: Int?, first: Bool?, sort: Sort?, numberOfElements: Int?, size: Int?, number: Int?, empty: Bool?) {
        self.content = content
        self.pageable = pageable
        self.last = last
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.first = first
        self.sort = sort
        self.numberOfElements = numberOfElements
        self.size = size
        self.number = number
        self.empty = empty
    }
}

// MARK: - Content
public struct ProductContent: Codable {
    public let productId: Int?
    public let productName: String?
    public let global: Bool?
    public let senderFee: Double?
    public let discountPercentage: Double?
    public let denominationType: String?
    public let recipientCurrencyCode: String?
    public let minRecipientDenomination: String?
    public let maxRecipientDenomination: String?
    public let senderCurrencyCode: String?
    public let minSenderDenomination: String?
    public let maxSenderDenomination: String?
    public let fixedRecipientDenominations: [Double]?
    public let fixedSenderDenominations: [Double]?
    public let fixedRecipientToSenderDenominationsMap: [String: Double]?
    public let logoUrls: [String]?
    public let brand: Brand?
    public let country: Country?
    public let redeemInstruction: RedeemInstruction?

    public init(productId: Int?, productName: String? = nil, global: Bool? = nil, senderFee: Double? = nil, discountPercentage: Double? = nil, denominationType: String? = nil, recipientCurrencyCode: String? = nil, minRecipientDenomination: String? = nil, maxRecipientDenomination: String? = nil, senderCurrencyCode: String? = nil, minSenderDenomination: String? = nil, maxSenderDenomination: String? = nil, fixedRecipientDenominations: [Double]? = nil, fixedSenderDenominations: [Double]? = nil, fixedRecipientToSenderDenominationsMap: [String: Double]? = nil, logoUrls: [String]? = nil, brand: Brand? = nil, country: Country? = nil, redeemInstruction: RedeemInstruction? = nil) {
        self.productId = productId
        self.productName = productName
        self.global = global
        self.senderFee = senderFee
        self.discountPercentage = discountPercentage
        self.denominationType = denominationType
        self.recipientCurrencyCode = recipientCurrencyCode
        self.minRecipientDenomination = minRecipientDenomination
        self.maxRecipientDenomination = maxRecipientDenomination
        self.senderCurrencyCode = senderCurrencyCode
        self.minSenderDenomination = minSenderDenomination
        self.maxSenderDenomination = maxSenderDenomination
        self.fixedRecipientDenominations = fixedRecipientDenominations
        self.fixedSenderDenominations = fixedSenderDenominations
        self.fixedRecipientToSenderDenominationsMap = fixedRecipientToSenderDenominationsMap
        self.logoUrls = logoUrls
        self.brand = brand
        self.country = country
        self.redeemInstruction = redeemInstruction
    }
}

// MARK: - Brand
public struct Brand: Codable {
    public let brandId: Int?
    public let brandName: String?

    public init(brandId: Int?, brandName: String?) {
        self.brandId = brandId
        self.brandName = brandName
    }
}


// MARK: - RedeemInstruction
public struct RedeemInstruction: Codable {
    public let concise: String?
    public let verbose: String?

    public init(concise: String?, verbose: String?) {
        self.concise = concise
        self.verbose = verbose
    }
}

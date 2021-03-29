//
//  ErrorModel.swift
//  ReloadlyAuthentication
//
//  Created by Taras Markevych on 15.03.2021.
//

import Foundation

struct ErrorModel: Codable {
    let path: String
    let timeStamp: String
    let message: String
}

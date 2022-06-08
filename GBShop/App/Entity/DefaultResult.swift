//
//  DefaultResult.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Foundation

struct DefaultResult: Codable {
    var result: Int
    var userMessage: String?
    var errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
        case errorMessage = "error_message"
    }
}

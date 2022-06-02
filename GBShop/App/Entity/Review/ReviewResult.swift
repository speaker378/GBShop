//
//  ReviewResult.swift
//  GBShop
//
//  Created by Сергей Черных on 23.05.2022.
//

import Foundation

struct ReviewResult: Codable {
    var result: Int?
    var userMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

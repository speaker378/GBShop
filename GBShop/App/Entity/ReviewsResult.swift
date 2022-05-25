//
//  ReviewsResult.swift
//  GBShop
//
//  Created by Сергей Черных on 25.05.2022.
//

import Foundation

struct ReviewsResult: Codable {
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case userMessage = "user_message"
    }
}

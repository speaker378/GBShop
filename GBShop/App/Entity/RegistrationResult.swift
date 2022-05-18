//
//  RegistrationResult.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}

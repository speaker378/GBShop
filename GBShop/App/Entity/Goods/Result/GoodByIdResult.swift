//
//  GoodByIdResult.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation

struct GoodByIdResult: Codable {
    let result: Int
    let productName: String?
    let price: Double?
    let description: String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case price
        case description
        case errorMessage = "error_message"
    }
}

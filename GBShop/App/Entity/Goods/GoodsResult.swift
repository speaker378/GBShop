//
//  GoodsResult.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation

struct GoodsResult: Codable {
    let result: Int
    let name: String
    let price: Decimal
    let description: String

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}

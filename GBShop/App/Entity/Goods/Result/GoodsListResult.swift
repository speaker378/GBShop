//
//  GoodsListResult.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation

struct GoodsListResult: Codable {
    let result: Int
    let pageNumber: Int?
    let products: [GoodsListItem]?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case pageNumber = "page_number"
        case products
        case errorMessage = "error_message"
    }
}

struct GoodsListItem: Codable {
    let productId: Int
    let productName: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case productName = "product_name"
        case price
    }
}

//
//  BasketResult.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation

struct BasketResult: Codable {
    let countGoods: Int
    let amount: Decimal
    let contents: [Product]
    
    enum CodingKeys: String, CodingKey {
        case countGoods = "count_goods"
        case amount = "amount"
        case contents = "contents"
    }
}

struct Product: Codable {
    let price: Decimal
    let id: Decimal
    let name: String
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case price = "price"
        case id = "id_product"
        case name = "product_name"
        case quantity = "quantity"
    }
}

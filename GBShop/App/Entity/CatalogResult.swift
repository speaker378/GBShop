//
//  CatalogResult.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation

struct CatalogResult: Codable {
    let id: Int
    let productName: String
    let productPrice: Decimal

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
}

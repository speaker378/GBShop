//
//  RemoveFromCartRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct RemoveFromCartRequest: Codable {
    let productId: Int
    let userId: Int
    let quantity: Int?
}

extension RemoveFromCartRequest {
    func toRequestParam() -> Parameters {
        return [
            "product_id": productId,
            "user_id": userId,
            "quantity": quantity as Any
        ]
    }
}

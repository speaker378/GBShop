//
//  GoodByIdRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct GoodByIdRequest: Codable {
    let productId: Int
}

extension GoodByIdRequest {
    func toRequestParam() -> Parameters {
        return [
            "product_id": productId
        ]
    }
}

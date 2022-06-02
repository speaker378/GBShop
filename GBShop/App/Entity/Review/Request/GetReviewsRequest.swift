//
//  GetReviewsRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct GetReviewsRequest: Codable {
    let productId: Int
}

extension GetReviewsRequest {
    func toRequestParam() -> Parameters {
        return [
            "product_id": productId,
        ]
    }
}

//
//  RemoveReviewRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct RemoveReviewRequest: Codable {
    let reviewId: Int
}

extension RemoveReviewRequest {
    func toRequestParam() -> Parameters {
        return [
            "review_id": reviewId,
        ]
    }
}

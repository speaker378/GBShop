//
//  GetCartRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 09.06.2022.
//

import Alamofire

struct GetCartRequest: Codable {
    let userId: Int
}

extension GetCartRequest {
    func toRequestParam() -> Parameters {
        return [
            "user_id": userId
        ]
    }
}

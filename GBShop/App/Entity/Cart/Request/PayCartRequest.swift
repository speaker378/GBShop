//
//  PayCartRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct PayCartRequest: Codable {
    let userId: Int
}

extension PayCartRequest {
    func toRequestParam() -> Parameters {
        return [
            "user_id": userId
        ]
    }
}

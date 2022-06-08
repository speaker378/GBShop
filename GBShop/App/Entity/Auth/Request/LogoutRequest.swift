//
//  LogoutRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct LogoutRequest: Codable {
    let id: Int
}

extension LogoutRequest {
    func toRequestParam() -> Parameters {
        return [
            "id": id
        ]
    }
}

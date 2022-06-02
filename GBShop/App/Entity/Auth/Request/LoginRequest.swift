//
//  LoginRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct LoginRequest: Codable {
    let login: String
    let password: String
}

extension LoginRequest {
    func toRequestParam() -> Parameters {
        return [
            "login": login,
            "password": password,
        ]
    }
}

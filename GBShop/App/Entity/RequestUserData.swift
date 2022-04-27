//
//  RequestUserData.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

struct RequestUserData {
    var userId: Int
    var userName: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

extension RequestUserData {
    func toRequestParam() -> Parameters {
        return [
            "id_user": userId,
            "username": userName,
            "password": password,
            "email": email,
            "gender": gender,
            "credit_card": creditCard,
            "bio": bio,
        ]
    }
}

struct UserDataRequestTest {
    static func getUserDataForTest() -> RequestUserData {
        return RequestUserData(
            userId: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "email",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        )
    }
}

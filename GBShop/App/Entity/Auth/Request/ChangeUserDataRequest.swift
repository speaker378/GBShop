//
//  ChangeUserDataRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct ChangeUserDataRequest: Codable {
    let id: Int
    let login: String
    let name: String
    let lastName: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
}

extension ChangeUserDataRequest {
    func toRequestParam() -> Parameters {
        return [
            "id": id,
            "login": login,
            "name": name,
            "last_name": lastName,
            "password": password,
            "email": email,
            "gender": gender,
            "credit_card": creditCard,
            "bio": bio
        ]
    }
}

struct ChangeUserDataRequestForTest {
    static func get() -> ChangeUserDataRequest {
        func randomString(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map { _ in letters.randomElement()! })
        }
        
        return ChangeUserDataRequest(
            id: 5,
            login: randomString(length: 7),
            name: randomString(length: 7),
            lastName: randomString(length: 7),
            password: "mypassword",
            email: randomString(length: 7),
            gender: "male",
            creditCard: "9872389-2424-234224-234",
            bio: randomString(length: 97))
    }
}

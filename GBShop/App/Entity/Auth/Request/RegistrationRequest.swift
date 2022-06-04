//
//  RegistrationRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct RegistrationRequest: Codable {
    let login: String
    let name: String
    let lastName: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
}

extension RegistrationRequest {
    func toRequestParam() -> Parameters {
        return [
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

struct RegistrationRequestForTest {
    static func get() -> RegistrationRequest {
        func randomString(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map { _ in letters.randomElement()! })
        }
        
        return RegistrationRequest(
            login: randomString(length: 7),
            name: "Somebody",
            lastName: "Somebody",
            password: "mypassword",
            email: randomString(length: 7),
            gender: "male",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
    }
}

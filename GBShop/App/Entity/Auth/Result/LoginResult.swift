//
//  LoginResult.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: UserData?
    let token: String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case user
        case token
        case errorMessage = "error_message"
    }
}

struct UserData: Codable {
    let id: Int
    let login: String
    let name: String?
    let lastName: String?
    let email: String
    let gender: String?
    let creditCard: String?
    let bio: String?
}

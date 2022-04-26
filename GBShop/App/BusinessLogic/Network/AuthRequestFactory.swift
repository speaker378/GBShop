//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

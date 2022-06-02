//
//  LoginRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

protocol LoginRequestFactory {
    func login(requestModel: LoginRequest, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

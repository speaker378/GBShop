//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Alamofire
import Foundation

protocol RegistrationRequestFactory {
    func registration(user: RegistrationRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

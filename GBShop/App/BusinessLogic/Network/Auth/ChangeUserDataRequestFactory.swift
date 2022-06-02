//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func change(user: ChangeUserDataRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

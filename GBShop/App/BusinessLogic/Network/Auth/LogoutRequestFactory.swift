//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(requestModel: LogoutRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

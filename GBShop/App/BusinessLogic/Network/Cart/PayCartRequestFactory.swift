//
//  PayCartRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 29.05.2022.
//

import Foundation
import Alamofire

protocol PayCartRequestFactory {
    func payCart(requestModel: PayCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}


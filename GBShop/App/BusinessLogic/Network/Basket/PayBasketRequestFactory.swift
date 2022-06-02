//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 29.05.2022.
//

import Foundation
import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}


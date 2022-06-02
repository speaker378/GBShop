//
//  GetBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

protocol GetBasketRequestFactory {
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void)
}

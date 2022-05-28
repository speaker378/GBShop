//
//  RemoveFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

protocol RemoveFromBasketRequestFactory {
    func removeFromBasket(quantity: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void)
}

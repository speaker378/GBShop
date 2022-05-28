//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(quantity: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}

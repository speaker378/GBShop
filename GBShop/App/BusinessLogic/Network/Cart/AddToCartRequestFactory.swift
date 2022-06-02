//
//  AddToCartRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

protocol AddToCartRequestFactory {
    func addToCart(requestModel: AddToCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

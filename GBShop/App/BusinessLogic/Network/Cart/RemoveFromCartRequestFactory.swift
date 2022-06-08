//
//  RemoveFromCartRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

protocol RemoveFromCartRequestFactory {
    func removeFromCart(requestModel: RemoveFromCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

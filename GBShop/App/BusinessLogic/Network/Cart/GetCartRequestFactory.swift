//
//  GetCartRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 09.06.2022.
//

import Foundation
import Alamofire

protocol GetCartRequestFactory {
    func getCart(requestModel: GetCartRequest, completionHandler: @escaping (AFDataResponse<GetCartResult>) -> Void)
}

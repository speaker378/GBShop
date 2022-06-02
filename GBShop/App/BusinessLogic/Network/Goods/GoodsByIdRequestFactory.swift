//
//  GoodsByIdRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation
import Alamofire

protocol GoodsByIdRequestFactory {
    func goods(requestModel: GoodByIdRequest, completionHandler: @escaping (AFDataResponse<GoodByIdResult>) -> Void)
}

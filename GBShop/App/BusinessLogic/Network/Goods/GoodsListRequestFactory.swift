//
//  GoodsListRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation
import Alamofire

protocol GoodsListRequestFactory {
    func catalog(requestModel: GoodsListRequest, completionHandler: @escaping (AFDataResponse<GoodsListResult>) -> Void)
}

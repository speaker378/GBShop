//
//  GoodsRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation
import Alamofire

protocol GoodsRequestFactory {
    func goods(id: Int, completionHandler: @escaping (AFDataResponse<GoodsResult>) -> Void)
}

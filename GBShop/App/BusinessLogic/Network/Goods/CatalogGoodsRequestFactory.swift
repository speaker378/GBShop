//
//  CatalogGoodsRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation
import Alamofire

protocol CatalogGoodsRequestFactory {
    func catalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void)
}

//
//  GoodsListRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct GoodsListRequest: Codable {
    let pageNumber: Int
    let categoryId: Int
}

extension GoodsListRequest {
    func toRequestParam() -> Parameters {
        return [
            "page_number": pageNumber,
            "category_id": categoryId
        ]
    }
}

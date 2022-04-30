//
//  Goods.swift
//  GBShop
//
//  Created by Сергей Черных on 27.04.2022.
//

import Foundation
import Alamofire

class Goods: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL = URL(string: "https://damp-harbor-76197.herokuapp.com/")!

    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: Catalog goods
extension Goods: CatalogGoodsRequestFactory {
    func catalog(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[CatalogResult]>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalog"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory,
            ]
        }
    }
}

// MARK: Goods
extension Goods: GoodsRequestFactory {
    func goods(id: Int, completionHandler: @escaping (AFDataResponse<GoodsResult>) -> Void) {
        let requestModel = GoodsRequestModel(baseUrl: baseUrl, productId: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct GoodsRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "get_goods_by_id"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
            ]
        }
    }
}

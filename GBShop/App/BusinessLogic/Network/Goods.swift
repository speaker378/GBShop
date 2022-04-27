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
    let baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

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
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
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

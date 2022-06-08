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
    let baseUrl: URL = API.baseUrl

    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: Goods list
extension Goods: GoodsListRequestFactory {
    func catalog(requestModel: GoodsListRequest, completionHandler: @escaping (AFDataResponse<GoodsListResult>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.getGoodsList.rawValue
        let requestData: GoodsListRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Goods by id
extension Goods: GoodsByIdRequestFactory {
    func goods(requestModel: GoodByIdRequest, completionHandler: @escaping (AFDataResponse<GoodByIdResult>) -> Void) {
        let requestModel = GoodsRequestModel(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Goods {
    struct GoodsRequestModel: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.goodsById.rawValue
        let requestData: GoodByIdRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

//
//  Basket.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
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

// MARK: Add to basket
extension Basket: AddToBasketRequestFactory {
    func addToBasket(quantity: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasketRequest(baseUrl: baseUrl, quantity: quantity, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct AddToBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.addToBasket.rawValue
        let quantity: Int
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity,
            ]
        }
    }
}

// MARK: Remove from basket
extension Basket: RemoveFromBasketRequestFactory {    
    func removeFromBasket(quantity: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = RemoveFromBasketRequest(baseUrl: baseUrl, quantity: quantity, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct RemoveFromBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.removeFromBasket.rawValue
        let quantity: Int
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity,
            ]
        }
    }
}

// MARK: Get basket
extension Basket: GetBasketRequestFactory {
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void) {
        let requestModel = GetBasketRequest(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct GetBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.getBasket.rawValue
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId,
            ]
        }
    }
}


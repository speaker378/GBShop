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
        let requestModel = addToBasketRequest(baseUrl: baseUrl, quantity: quantity, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Basket {
    struct addToBasketRequest: RequestRouter {
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


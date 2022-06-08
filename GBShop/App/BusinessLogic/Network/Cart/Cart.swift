//
//  Cart.swift
//  GBShop
//
//  Created by Сергей Черных on 28.05.2022.
//

import Foundation
import Alamofire

class Cart: AbstractRequestFactory {
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
extension Cart: AddToCartRequestFactory {
    func addToCart(requestModel: AddToCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = AddToBasketRequest(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Cart {
    struct AddToBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.addToCart.rawValue
        let requestData: AddToCartRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Remove from basket
extension Cart: RemoveFromCartRequestFactory {    
    func removeFromCart(requestModel: RemoveFromCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = RemoveFromBasketRequest(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Cart {
    struct RemoveFromBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.removeFromCart.rawValue
        let requestData: RemoveFromCartRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Pay basket
extension Cart: PayCartRequestFactory {
    func payCart(requestModel: PayCartRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Cart {
    struct PayBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.payCart.rawValue
        let requestData: PayCartRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

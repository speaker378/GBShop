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

// MARK: Add to cart
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

// MARK: Remove from cart
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

// MARK: Pay cart
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

// MARK: Get cart
extension Cart: GetCartRequestFactory {    
    func getCart(requestModel: GetCartRequest, completionHandler: @escaping (AFDataResponse<GetCartResult>) -> Void) {
        let requestModel = GetBasketRequest(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Cart {
    struct GetBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.getCart.rawValue
        let requestData: GetCartRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

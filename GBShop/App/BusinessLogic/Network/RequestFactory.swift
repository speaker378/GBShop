//
//  RequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)

    // MARK: Auth
    func makeLoginRequestFactory() -> LoginRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserDataFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: Goods
    func makeGoodsList() -> GoodsListRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeGoodsById() -> GoodsByIdRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    // MARK: Review
    func makeAddReview() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRemoveReview() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetReviews() -> ReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    // MARK: Cart
    func makeAddToCart() -> AddToCartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRemoveFromCart() -> RemoveFromCartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makePayCart() -> PayCartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCart() -> GetCartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

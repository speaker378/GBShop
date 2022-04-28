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
    func makeAuthRequestFactory() -> AuthRequestFactory {
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
    func makeCatalogGoods() -> CatalogGoodsRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeGoods() -> GoodsRequestFactory {
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

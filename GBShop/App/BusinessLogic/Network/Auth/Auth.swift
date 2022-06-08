//
//  Auth.swift
//  GBShop
//
//  Created by Сергей Черных on 26.04.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
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

// MARK: Login
extension Auth: LoginRequestFactory {
    func login(requestModel: LoginRequest, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.login.rawValue
        let requestData: LoginRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Logout
extension Auth: LogoutRequestFactory {
    func logout(requestModel: LogoutRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.logout.rawValue
        let requestData: LogoutRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Registration
extension Auth: RegistrationRequestFactory {
    func registration(user: RegistrationRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.register.rawValue
        let userData: RegistrationRequest

        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

// MARK: Change user data
extension Auth: ChangeUserDataRequestFactory {
    func change(user: ChangeUserDataRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.changeUserData.rawValue
        let userData: ChangeUserDataRequest
        
        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

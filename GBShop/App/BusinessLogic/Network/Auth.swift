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
extension Auth: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.login.rawValue
        let login: String
        let password: String
        var parameters: Parameters? {
            return [ "username": login, "password": password]
        }
    }
}

// MARK: Logout
extension Auth: LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.logout.rawValue
        let userId: Int
        var parameters: Parameters? {
            return ["id_user": userId]
        }
    }
}

// MARK: Registration
extension Auth: RegistrationRequestFactory {
    func registration(user: RequestUserData, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.register.rawValue
        let userData: RequestUserData

        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

// MARK: Change user data
extension Auth: ChangeUserDataRequestFactory {
    func change(user: RequestUserData, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.changeUserData.rawValue
        let userData: RequestUserData
        
        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

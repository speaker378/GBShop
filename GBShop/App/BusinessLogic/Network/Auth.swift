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
    let baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: Login
extension Auth: AuthRequestFactory {
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
            let requestModel = Login(baseUrl: baseUrl,
                                     login: userName,
                                     password: password)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
}

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [ "username": login, "password": password]
        }
    }
}

// MARK: Logout
extension Auth: LogoutRequestFactory {
    func logout(
        userId: Int,
        completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
            let requestModel = Logout(baseUrl: baseUrl, userId: userId)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
}

extension Auth {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userId: Int
        var parameters: Parameters? {
            return ["id_user": userId]
        }
    }
}

// MARK: Registration
extension Auth: RegistrationRequestFactory {
    func registeration(
        user: RegistrationDataRequest,
        completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
     struct Registration: RequestRouter {
         let baseUrl: URL
         let method: HTTPMethod = .get
         let path: String = "registerUser.json"
         let userData: RegistrationDataRequest

         var parameters: Parameters? {
             return userData.toRequestParam()
         }
     }
 }

//
//  Crashlytics+Ext.swift
//  GBShop
//
//  Created by Сергей Черных on 10.06.2022.
//

import Foundation
import FirebaseCrashlytics

enum UserActionLog: String {
    case loginSuccess = "Successful login"
    case loginFailure = "Unsuccessful login"
    case registrationSuccess = "Successful registration"
    case registrationFailure = "Unsuccessful registration"
    case viewCatalog = "Viewing the product catalog"
    case viewDetailProduct = "Viewing the product detail"
    case tapPay = "Shopping cart payment"
    
}

extension Crashlytics {
    static func createLog(_ log: UserActionLog) {
        self.crashlytics().log(log.rawValue)
    }
}

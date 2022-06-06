//
//  CurrentUser.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import Foundation

final class CurrentUser {
    static let shared = CurrentUser()
    var user: UserData?
    
    private init() { }
}

//
//  API.swift
//  GBShop
//
//  Created by Сергей Черных on 01.05.2022.
//

import Foundation

enum API: String, APIProtocol {
    static let baseUrl = URL(string: "https://damp-harbor-76197.herokuapp.com/")!

    // MARK: Auth
    case login
    case logout
    case register
    case changeUserData = "change_user_data"
    
    // MARK: Goods
    case catalog
    case goodsById = "get_goods_by_id"
    
    // MARK: Review
    case addReview = "add_review"
    case removeReview = "remove_review"
    case listReviews = "list_reviews"
    
    // MARK: Basket
    case addToBasket = "add_to_basket"
    case removeFromBasket = "remove_from_basket"
    case getBasket = "get_basket"
    case payBasket = "pay_basket"
}

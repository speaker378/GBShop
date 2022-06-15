//
//  API.swift
//  GBShop
//
//  Created by Сергей Черных on 01.05.2022.
//

import Foundation

enum API: String, APIProtocol {
    static let baseUrl = URL(string: "https://vapor-gb-shop.herokuapp.com/")!

    // MARK: Auth
    case login
    case logout
    case register
    case changeUserData = "change_user_data"
    
    // MARK: Goods
    case getGoodsList = "get_goods_list"
    case goodsById = "get_good_by_id"
    
    // MARK: Review
    case addReview = "add_review"
    case removeReview = "remove_review"
    case getReviews = "get_reviews"
    
    // MARK: Cart
    case addToCart = "add_to_cart"
    case removeFromCart = "remove_from_cart"
    case payCart = "pay_cart"
    case getCart = "get_cart"
}

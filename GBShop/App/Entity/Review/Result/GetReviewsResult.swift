//
//  GetReviewsResult.swift
//  GBShop
//
//  Created by Сергей Черных on 25.05.2022.
//

import Foundation

struct GetReviewsResult: Codable {
    let result: Int
    let reviews: [ReviewResult]?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case reviews
        case errorMessage
    }
}

struct ReviewResult: Codable {
    let id: Int
    let productId: Int
    let userId: Int
    let text: String
    let rating: Int
    let likes: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case productId
        case userId
        case text
        case rating
        case likes
    }
}

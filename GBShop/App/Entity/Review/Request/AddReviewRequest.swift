//
//  AddReviewRequest.swift
//  GBShop
//
//  Created by Сергей Черных on 03.06.2022.
//

import Alamofire

struct AddReviewRequest: Codable {
    let productId: Int
    let userId: Int
    let text: String
    let rating: Int
}

extension AddReviewRequest {
    func toRequestParam() -> Parameters {
        return [
            "product_id": productId,
            "user_id": userId,
            "text": text,
            "rating": rating,
        ]
    }
}

struct AddReviewRequestForTest {
    static func get() -> AddReviewRequest {
        func randomString(length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map{ _ in letters.randomElement()! })
        }
        
        return AddReviewRequest(
            productId: Int.random(in: 1...5),
            userId: Int.random(in: 1...5),
            text: randomString(length: 22),
            rating: 4
        )
    }
}

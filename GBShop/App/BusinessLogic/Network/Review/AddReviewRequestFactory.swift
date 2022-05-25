//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 23.05.2022.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func review(text: String, userId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
}

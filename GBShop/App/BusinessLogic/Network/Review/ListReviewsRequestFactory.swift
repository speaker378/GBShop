//
//  ListReviewsRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 25.05.2022.
//

import Foundation
import Alamofire

protocol ListReviewsRequestFactory {
    func reviews(userId: Int, completionHandler: @escaping (AFDataResponse<[ReviewsResult]>) -> Void)
}

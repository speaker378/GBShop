//
//  ReviewsRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 25.05.2022.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {
    func reviews(requestModel: GetReviewsRequest, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void)
}

//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 25.05.2022.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func review(requestModel: RemoveReviewRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

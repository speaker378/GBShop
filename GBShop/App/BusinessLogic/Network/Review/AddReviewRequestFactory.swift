//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Сергей Черных on 23.05.2022.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func review(requestModel: AddReviewRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}

//
//  Review.swift
//  GBShop
//
//  Created by Сергей Черных on 23.05.2022.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL = API.baseUrl
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: Add review
extension Review: AddReviewRequestFactory {
    func review(requestModel: AddReviewRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.addReview.rawValue
        let requestData: AddReviewRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: Remove review
extension Review: RemoveReviewRequestFactory {
    func review(requestModel: RemoveReviewRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.removeReview.rawValue
        let requestData: RemoveReviewRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

// MARK: List reviews
extension Review: ReviewsRequestFactory {
    func reviews(requestModel: GetReviewsRequest, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void) {
        let requestModel = ListReviews(baseUrl: baseUrl, requestData: requestModel)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct ListReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.getReviews.rawValue
        let requestData: GetReviewsRequest
        var parameters: Parameters? {
            return requestData.toRequestParam()
        }
    }
}

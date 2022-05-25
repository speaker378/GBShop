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
    func review(text: String, userId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userId: userId, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.addReview.rawValue
        let userId: Int
        let text: String
        var parameters: Parameters? {
            return [
                "text": text,
                "id_user": userId,
            ]
        }
    }
}

// MARK: Remove review
extension Review: RemoveReviewRequestFactory {
    func review(commentId: Int, completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, commentId: commentId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.removeReview.rawValue
        let commentId: Int
        var parameters: Parameters? {
            return [
                "id_comment": commentId,
            ]
        }
    }
}

// MARK: List reviews
extension Review: ListReviewsRequestFactory {
    func reviews(userId: Int, completionHandler: @escaping (AFDataResponse<[ReviewsResult]>) -> Void) {
        let requestModel = ListReviews(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Review {
    struct ListReviews: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = API.listReviews.rawValue
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId,
            ]
        }
    }
}

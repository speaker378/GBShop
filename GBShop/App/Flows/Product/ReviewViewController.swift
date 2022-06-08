//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 07.06.2022.
//

import UIKit

final class ReviewViewController: UIViewController {
    
    lazy var reviewsRequestService: ReviewsRequestFactory = {
        return RequestFactory().makeGetReviews()
    }()
    
    lazy var addReviewRequestService: AddReviewRequestFactory = {
        return RequestFactory().makeAddReview()
    }()
    
    private var reviewView = ProductReviewView()
    private let goodId: Int
    
    var reviews: GetReviewsResult? {
        didSet {
            showReviews()
        }
    }
    
    init(goodId: Int) {
        self.goodId = goodId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReviewsByProductId(goodId)
    }
    
    override func loadView() {
        super.loadView()
        view = reviewView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reviewView.addReviewButton.addTarget(self, action: #selector(tapButtonAddReview), for: .touchUpInside)
    }
    
    @objc
    private func tapButtonAddReview(sender _: UIButton) {
        addReviewRequestService.review(requestModel: AddReviewRequest(
            productId: goodId,
            userId: CurrentUser.shared.user!.id,
            text: reviewView.reviewTextView.text ?? "",
            rating: Int.random(in: 1...5))) { response in
            switch response.result {
            case .success(let result):
                if result.result == 1 {
                    print(result.userMessage ?? "")
                } else {
                    print(result.errorMessage ?? "")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func showReviews() {
        guard let reviews = reviews?.reviews else { return }
        reviewView.makeReviews(reviews: reviews)
    }
    
    private func fetchReviewsByProductId(_ id: Int) {
        reviewsRequestService.reviews(requestModel: GetReviewsRequest(productId: id)) { [unowned self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    if result.result == 1 {
                        self.reviews = result
                    } else {
                        print(result.errorMessage ?? "Error")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//
//  ReviewTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 25.05.2022.
//


import XCTest
@testable import GBShop

class ReviewTests: XCTestCase {
    let goodResponse = 1
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetListReviews() throws {
        let request = requestFactory.makeGetReviews()
        request.reviews(requestModel: GetReviewsRequest(productId: 2)) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }

    func testAddReview() throws {
        let request = requestFactory.makeAddReview()
        request.review(requestModel: AddReviewRequestForTest.get()) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }
    
    func testRemoveReview() throws {
        let request = requestFactory.makeRemoveReview()
        request.review(requestModel: RemoveReviewRequest(reviewId: 2)) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }
}

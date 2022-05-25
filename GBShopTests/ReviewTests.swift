//
//  ReviewTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 25.05.2022.
//


import XCTest
@testable import GBShop

class ReviewTests: XCTestCase {
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetListReviews() throws {
        let request = requestFactory.makeGetListReviews()
        request.reviews(userId: 123) { [unowned self] response in
            switch response.result {
            case .success(let reviews):
                XCTAssert(!reviews.isEmpty, "the product catalog should not be empty")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }

    func testAddReviews() throws {
        let goodResponse = 1
        let request = requestFactory.makeAddReview()
        request.review(text: "text message", userId: 123) { [unowned self] response in
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
    
    func testRemoveReviews() throws {
        let goodResponse = 1
        let request = requestFactory.makeRemoveReview()
        request.review(commentId: 123) { [unowned self] response in
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

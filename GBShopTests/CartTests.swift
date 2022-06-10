//
//  CartTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 28.05.2022.
//

import XCTest
@testable import GBShop

class CartTests: XCTestCase {
    let goodResponse = 1
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddToCart() throws {
        let request = requestFactory.makeAddToCart()
        request.addToCart(requestModel: AddToCartRequest(productId: 1, userId: 1, quantity: 3)) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail("oops")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 18)
    }
    
    func testDeleteFromCart() throws {
        let request = requestFactory.makeRemoveFromCart()
        request.removeFromCart(requestModel: RemoveFromCartRequest(productId: 1, userId: 1, quantity: 1)) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail("oops")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 18)
    }
    
    func testPayCart() throws {
        let request = requestFactory.makePayCart()
        request.payCart(requestModel: PayCartRequest(userId: 1)) { [unowned self] response in
            switch response.result {
            case .success(let data):
                XCTAssertEqual(data.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail("oops")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 18)
    }
}

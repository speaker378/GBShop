//
//  BasketTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 28.05.2022.
//

import XCTest
@testable import GBShop

class BasketTests: XCTestCase {
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddToBasket() throws {
        let goodResponse = 1
        let request = requestFactory.makeAddToBasket()
        request.addToBasket(quantity: 1, idProduct: 123) { [unowned self] response in
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
    
    func testRemoveFromBasket() throws {
        let goodResponse = 1
        let request = requestFactory.makeRemoveFromBasket()
        request.removeFromBasket(quantity: 1, idProduct: 123) { [unowned self] response in
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
    
    func testGetBasket() throws {
        let request = requestFactory.makeGetBasket()
        request.getBasket(userId: 123) { [unowned self] response in
            switch response.result {
            case .success(let basket):
                XCTAssert(!basket.contents.isEmpty, "the products in basket should not be empty")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }
}

//
//  GoodsTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 27.04.2022.
//

import XCTest
@testable import GBShop

class GoodsTests: XCTestCase {
    let goodResponse = 1
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCatalogGoods() throws {
        let catalogGoodsRequest = requestFactory.makeGoodsList()
        catalogGoodsRequest.catalog(requestModel: GoodsListRequest(pageNumber: 1, categoryId: 1)) { [unowned self] response in
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

    func testGetGoods() throws {
        let goodsRequest = requestFactory.makeGoodsById()
        goodsRequest.goods(requestModel: GoodByIdRequest(productId: 1)) { [unowned self] response in
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

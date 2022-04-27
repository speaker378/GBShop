//
//  GoodsTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 27.04.2022.
//

import XCTest
@testable import GBShop

class GoodsTests: XCTestCase {
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCatalogGoods() throws {
        let catalogGoodsRequest = requestFactory.makeCatalogGoods()
        catalogGoodsRequest.catalogGoods(pageNumber: 1, idCategory: 1) { [unowned self] response in
            switch response.result {
            case .success(let catalog):
                XCTAssertEqual(catalog.goods, ![Goods].isEmpty, "the product catalog should not be empty")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }
}

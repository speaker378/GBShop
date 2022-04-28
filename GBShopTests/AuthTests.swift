//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Сергей Черных on 27.04.2022.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    let requestFactory = RequestFactory()
    let expectation = XCTestExpectation(description: "waiting for a response from the server")
    let goodResponse = 1

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuth() throws {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { [unowned self] response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }

    func testLogout() throws {
        let logoutRequest = requestFactory.makeLogoutRequestFactory()
        logoutRequest.logout(userId: 123) { [unowned self] response in
            switch response.result {
            case .success(let logout):
                XCTAssertEqual(logout.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 8)
    }

    func testRegistration() throws {
        let registrationRequest = requestFactory.makeRegistrationRequestFactory()
        let userData = UserDataRequestTest.getUserDataForTest()
        registrationRequest.registration(user: userData) { [unowned self] response in
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

    func testChangeUserData() throws {
        let changeUserDataRequest = requestFactory.makeChangeUserDataFactory()
        let userData = UserDataRequestTest.getUserDataForTest()
        changeUserDataRequest.change(user: userData) { [unowned self] response in
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

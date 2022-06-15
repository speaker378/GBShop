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

    func testLogin() throws {
        let auth = requestFactory.makeLoginRequestFactory()
        auth.login(requestModel: LoginRequest(login: "Duncan_Gerhold3", password: "8NP4I9Xh")) { [unowned self] response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail("oops")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 18)
    }

    func testLogout() throws {
        let logoutRequest = requestFactory.makeLogoutRequestFactory()
        logoutRequest.logout(requestModel: LogoutRequest(id: 2)) { [unowned self] response in
            switch response.result {
            case .success(let logout):
                XCTAssertEqual(logout.result, goodResponse, "must have an answer of \(goodResponse)")
            case .failure:
                XCTFail("oops")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 18)
    }

    func testRegistration() throws {
        let registrationRequest = requestFactory.makeRegistrationRequestFactory()
        let userData = RegistrationRequestForTest.get()
        registrationRequest.registration(user: userData) { [unowned self] response in
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

    func testChangeUserData() throws {
        let changeUserDataRequest = requestFactory.makeChangeUserDataFactory()
        let userData = ChangeUserDataRequestForTest.get()
        changeUserDataRequest.change(user: userData) { [unowned self] response in
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

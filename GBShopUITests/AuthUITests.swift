//
//  AuthUITests.swift
//  GBShopUITests
//
//  Created by Сергей Черных on 21.04.2022.
//

import XCTest

class AuthUITests: XCTestCase {
    
    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        scrollViewsQuery = app.scrollViews
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoginSuccess() throws {
        loginWith(login: "Duncan_Gerhold3", password: "8NP4I9Xh")
        XCTAssertEqual(app.navigationBars["page title"].staticTexts["Profile"].label, "Profile")
    }
    
    func testLoginEmptyFields() throws {
        loginWith(login: "", password: "")
        let alert = app.alerts.firstMatch
        XCTAssert(alert.staticTexts["fields cannot be empty"].waitForExistence(timeout: 2.0))
    }
    
    func testLoginWrongData() throws {
        loginWith(login: "admin", password: "admin")
        let alert = app.alerts.firstMatch
        XCTAssert(alert.staticTexts["Wrong login or password"].waitForExistence(timeout: 7.0))
    }
    
    private func loginWith(login: String, password: String) {
        let loginTextField = scrollViewsQuery.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(login)
        
        let passwordTextField = scrollViewsQuery.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        let button = scrollViewsQuery.buttons["login button"]
        button.tap()
    }
}

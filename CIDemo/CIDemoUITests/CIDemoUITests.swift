//
//  CIDemoUITests.swift
//  CIDemoUITests
//
//  Created by Rahul Sharma on 29/12/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import XCTest
@testable import CIDemo

class CIDemoUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInvalidEmailTextField() {
        validate(email: "abc@abc")
    }
    
    func testInvalidEmailTextField1() {
        validate(email: "")
    }
    
    func testValidEmailTextField() {
        validate(email: "abc@abc.com")
    }
    
    func testInvalidPasswordTextField0() {
        validate(password: "")
    }
        
    func testInvalidPasswordTextField1() {
        validate(password: "ABC")
    }
    
    func testInvalidPasswordTextField2() {
        validate(password: "abc")
    }

    func testInvalidPasswordTextField3() {
        validate(password: "Abc")
    }
    
    func testInvalidPasswordTextField4() {
        validate(password: "Abc123")
    }

    func testInvalidPasswordTextField5() {
        validate(password: "Abc@#$")
    }

    func testInvalidPasswordTextField6() {
        validate(password: "Abc@12")
    }
    
    func testValidPasswordTextField() {
        validate(password: "Abc@123")
    }
    
    func testValidEmaiAndValidPassword() {
        validate(email: "abc@abc.com", and: "Abc@123")
    }
    
    func testValidEmaiAndInvalidPassword() {
        validate(email: "abc@abc.com", and: "abc")
    }
    
    func testInvalidEmaiAndValidPassword() {
        validate(email: "abc@abc.com", and: "Abc@123")
    }
    
    func testInvalidEmaiAndInvalidPassword() {
        validate(email: "abc@abc.com", and: "abc")
    }
    
    func validate(email: String) {
        textField("LVCEmailTextField", set: email)
        if email.count > 0, !email.isValidEmail() {
            validateAlert()
        }
    }
    
    func validate(password: String) {
        secureTextField("LVCPasswordTextField", set: password)
        if password.count > 0, !password.isValidPassword() {
            validateAlert()
        }
    }
    
    func validate(email: String, and password: String) {
        textField("LVCEmailTextField", set: email)
        secureTextField("LVCPasswordTextField", set: password)
        validateAlert()
    }

    func textField(_ identifier: String, set text: String) {
        let app = XCUIApplication()
        let textField = app.textFields[identifier]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText(text)
        tapNextButton()
    }
    
    func secureTextField(_ identifier: String, set text: String) {
        let app = XCUIApplication()
        let textField = app.secureTextFields[identifier]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText(text)
        tapDoneButton()
    }
    
    func tapNextButton() {
        let app = XCUIApplication()
        let nextButton = app.buttons["Next"]
        XCTAssert(nextButton.exists)
        nextButton.tap()
    }
    
    func tapDoneButton() {
        let app = XCUIApplication()
        let doneButton = app.buttons["Done"]
        XCTAssert(doneButton.exists)
        doneButton.tap()
    }
    
    func tapLoginButton() {
        let app = XCUIApplication()
        let loginButton = app.buttons["LVCLoginButton"]
        XCTAssert(loginButton.exists)
        loginButton.tap()
    }
    
    func validateAlert() {
        let app = XCUIApplication()
        let alert = app.alerts["LVCAlertView"]
        XCTAssert(alert.exists)
        
        let failTitle = alert.staticTexts["Alert"]
        let successTitle = alert.staticTexts["Message"]
        let okButton = alert.buttons["OK"]
        
        if successTitle.exists {
            validateAlert(successTitle, and: okButton)
        } else if failTitle.exists {
            validateAlert(failTitle, and: okButton)
        }
    }
    
    func validateAlert(_ title:  XCUIElement, and button: XCUIElement) {
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: title, handler: nil)
        XCTAssert(button.exists)
        waitForExpectations(timeout: 5, handler: nil)
        button.tap()
    }
    
    
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                //                XCUIApplication().launch()
            }
        }
    }
}

//
//  CIDemoTests.swift
//  CIDemoTests
//
//  Created by Rahul Sharma on 29/12/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import XCTest
@testable import CIDemo

class CIDemoTests: XCTestCase {

    var email1: String?
    var password1: String?
    
    var email2: String?
    var password2: String?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        email1 = "abc"
        password1 = "123"
        
        email2 = "abc@abc.com"
        password2 = "ABC@abc123"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        if let email = email1, let password = password1 {
            XCTAssertFalse(email.isValidEmail(), "Email1 is not valid email")
            XCTAssertFalse(password.isValidPassword(), "Password1 is not valid strong password")
        }
        if let email = email2, let password = password2 {
            XCTAssertTrue(email.isValidEmail(), "Email1 is valid email")
            XCTAssertTrue(password.isValidPassword(), "Password1 is valid strong password")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

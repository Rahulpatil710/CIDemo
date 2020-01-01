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
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        validate(email: "Rahul")
        validate(email: "rpatil@mobifyi.com")
        validate(password: "RAHUL")
        validate(password: "rahul")
        validate(password: "Rahul")
        validate(password: "Rahul123")
        validate(password: "Rahul@1")
        validate(password: "Rahul@123")
    }
    
    func validate(email: String) {
        if email.isValidEmail() {
            XCTAssertTrue(email.isValidEmail(), "Email is valid")
        } else {
            XCTAssertFalse(email.isValidEmail(), "Email is not valid")
        }
    }
    
    func validate(password: String) {
        if password.isValidPassword() {
            XCTAssertTrue(password.isValidPassword(), "Password is valid")
        } else {
            XCTAssertFalse(password.isValidPassword(), "Password is not valid")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

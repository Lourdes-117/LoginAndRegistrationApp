//
//  TringappsTrainingTask1Tests.swift
//  TringappsTrainingTask1Tests
//
//  Created by Tringapps on 06/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest;
@testable import TringappsTrainingTask1;

class testLoginScreen: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testValidUserName() {
        var userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check@google.com")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check@google.co")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check@tringapps.co")
        XCTAssertNil(userNameStatus)


        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check@tringapps.com")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check-123@tringapps.com")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check_check@tringapps.com")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check_check@tringapps.xyz")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check_check@tringapps.check")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check_check@tringapps.com")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "9898989898")
        XCTAssertNil(userNameStatus)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "1234567890")
        XCTAssertNil(userNameStatus)
        
    }

    func testInValidUserName(){
        var userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_EMPTY.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "@google.com")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: ".com")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "@.com")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "@.")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "check@123.com")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "email123@gmail.com123")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "@tringapps.com")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "justastring")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "123456789")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)

        userNameStatus = LoginFormValidation.isUserNameValid(enteredUserName: "12345678901234567890")
        XCTAssertEqual(userNameStatus, LoginStatus.USERNAME_INVALID.rawValue)
    }
}

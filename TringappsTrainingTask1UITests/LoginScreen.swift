//
//  TringappsTrainingTask1UITests.swift
//  TringappsTrainingTask1UITests
//
//  Created by Tringapps on 06/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest

class LoginScreen: XCTestCase {

    let loginButtonIdentifier = "loginButtonIdentifier"
    let UserNameIdentifier = "UserNameIdentifier"
    let passwordIdentifier = "passwordIdentifier"
    let logoutIdentifier = "logoutIdentifier"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidUserNameAndValidPassword(){
        let validUserName = "abc@tringapps.com"
        let validPassword = "Pass@123"

        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let userNameField = elementsQuery.textFields[UserNameIdentifier]
        userNameField.tap()
        userNameField.typeText(validUserName)

        let passwordField = elementsQuery.secureTextFields[passwordIdentifier]
        passwordField.tap()
        XCTAssertTrue(passwordField.isEnabled)
        passwordField.typeText(validPassword)

        elementsQuery.buttons[loginButtonIdentifier].tap()

        let logOutButton = XCUIApplication().buttons["LogOut"]
        XCTAssertTrue(logOutButton.exists)
        logOutButton.tap()
    }

    func testInValidUserNameAndValidPassword(){
        let inValidUserName = "testing@tringapps.com"
        let validPassword = "Pass@123"

        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let userNameField = elementsQuery.textFields[UserNameIdentifier]
        userNameField.tap()
        userNameField.typeText(inValidUserName)

        let passwordField = elementsQuery.secureTextFields[passwordIdentifier]
        passwordField.tap()
        XCTAssertTrue(passwordField.isEnabled)
        passwordField.typeText(validPassword)

        elementsQuery.buttons[loginButtonIdentifier].tap()

        let logOutButton = XCUIApplication().buttons["LogOut"]
        XCTAssertFalse(logOutButton.exists)

    }

    func testValidUserNameAndInValidPassword(){
        let validUserName = "abc@tringapps.com"
        let inValidPassword = "Pass@123456"

        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let userNameField = elementsQuery.textFields[UserNameIdentifier]
        userNameField.tap()
        userNameField.typeText(validUserName)

        let passwordField = elementsQuery.secureTextFields[passwordIdentifier]
        passwordField.tap()
        XCTAssertTrue(passwordField.isEnabled)
        passwordField.typeText(inValidPassword)

        elementsQuery.buttons[loginButtonIdentifier].tap()

        let logOutButton = XCUIApplication().buttons["LogOut"]
        XCTAssertFalse(logOutButton.exists)

    }

    func testUserNameNotInFormat(){
        let validUserName = "JustAText"

        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let userNameField = elementsQuery.textFields[UserNameIdentifier]
        userNameField.tap()
        userNameField.typeText(validUserName)

        let passwordField = elementsQuery.secureTextFields[passwordIdentifier]
        passwordField.tap()
        XCTAssertFalse(passwordField.isEnabled)
    }

    func testPasswordNotInFormat(){
        let validUserName = "abc@tringapps.com"
        let inValidPassword = "justapass"

        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let userNameField = elementsQuery.textFields[UserNameIdentifier]
        userNameField.tap()
        userNameField.typeText(validUserName)

        let passwordField = elementsQuery.secureTextFields[passwordIdentifier]
        passwordField.tap()
        XCTAssertTrue(passwordField.isEnabled)
        passwordField.typeText(inValidPassword)

        elementsQuery.buttons[loginButtonIdentifier].tap()

        let logOutButton = XCUIApplication().buttons["LogOut"]
        XCTAssertFalse(logOutButton.exists)
    }
}

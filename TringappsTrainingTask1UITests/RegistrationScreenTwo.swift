//
//  RegistrationScreenTwo.swift
//  TringappsTrainingTask1UITests
//
//  Created by Tringapps on 07/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest

class RegistrationScreenTwo: XCTestCase {

    let imageImportIdentifier = "imageImportIdentifier"
    let statusIdentifier = "statusIdentifier"
    let aboutMeIdentifier = "aboutMeIdentifier"
    let registerIdentifier = "registerIdentifier"
    let previousIdentifier = "previousIdentifier"

    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    var elementsQuery: XCUIElementQuery!
    override func setUp() {
        super.setUp();
        continueAfterFailure = false
        XCUIApplication().launch()

        let logOutButton = XCUIApplication().buttons["logoutIdentifier"]
        if(logOutButton.exists){
            logOutButton.tap()
        }

        let signUpIdentifier = "signupIdentifier"

        let firstNameIdentifier = "firstNameIdentifier"
        let lastNameIdentifier = "lastNameIdentifier"
        let dobIdentifier = "dobIdentifier"
        let emailIdentifier = "emailIdentifier"
        let phoneNumberIdentifier = "phoneNumberIdentifier"
        let passwordIdentifier = "passwordIdentifier"
        let confirmPasswordIdentifier = "confirmPasswordIdentifier"
        let addressIdentifier = "addressIdentifier"
        let continueButtonIdentifier = "continueButtonIdentifier"

        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is a valid address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        app = XCUIApplication()
        scrollViewsQuery = app.scrollViews
        elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons[signUpIdentifier].tap()

        let firstName = elementsQuery.textFields[firstNameIdentifier]
        firstName.tap()
        firstName.typeText(firstNameString)

        let lastName = elementsQuery.textFields[lastNameIdentifier]
        lastName.tap()
        lastName.typeText(lastNameString)

        let dateOfBirth = elementsQuery.textFields[dobIdentifier]
        dateOfBirth.tap()

        let datePickersQuery = app.datePickers
        datePickersQuery.pickerWheels["1990"].adjust(toPickerWheelValue: yearString)
        datePickersQuery.pickerWheels["1"].adjust(toPickerWheelValue: dateString)
        datePickersQuery.pickerWheels["January"].adjust(toPickerWheelValue: monthString)

        let emailId = elementsQuery.textFields[emailIdentifier]
        emailId.tap()
        emailId.typeText(emailIDString)

        let phoneNumber = elementsQuery.textFields[phoneNumberIdentifier]
        phoneNumber.tap()
        phoneNumber.typeText(phoneNumberString)

        let password = elementsQuery.secureTextFields[passwordIdentifier]
        password.tap()
        password.typeText(paswordString)

        let confirmPassword = elementsQuery.secureTextFields[confirmPasswordIdentifier]
        XCTAssertTrue(confirmPassword.isEnabled)
        confirmPassword.tap()
        confirmPassword.typeText(paswordString)

        let address = elementsQuery.textViews[addressIdentifier]
        address.tap()
        address.typeText(addressString)

        elementsQuery.buttons[continueButtonIdentifier].tap()

        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertTrue(status.exists)
    }
    func testAllValid(){
        let statusString = "This is a Valid Status"
        let aboutMeString = "This text is a Valid About Me. This will work"
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let imageImport = elementsQuery.buttons[imageImportIdentifier]
        imageImport.tap()
        sleep(15)
        app.cells["Camera Roll"].tap()
        app.collectionViews["PhotosGridView"].children(matching: .cell).element(boundBy: 1).tap()
        sleep(1)
        let status = elementsQuery.textFields[statusIdentifier]
        status.tap()
        status.typeText(statusString)

        let aboutMe = elementsQuery.textViews[aboutMeIdentifier]
        aboutMe.tap()
        aboutMe.typeText(aboutMeString)

        let register = elementsQuery.buttons[registerIdentifier]
        register.tap();

        let inValidInputAlert = XCUIApplication().alerts["Invalid Input"]
        XCTAssertFalse(inValidInputAlert.exists)

        let details = XCUIApplication().staticTexts["Details"]
        XCTAssertTrue(details.exists)
    }

    func testInValidImage(){
        let statusString = "This is a Valid Status"
        let aboutMeString = "This text is a Valid About Me. This will work"
        let elementsQuery = XCUIApplication().scrollViews.otherElements

        let status = elementsQuery.textFields[statusIdentifier]
        status.tap()
        status.typeText(statusString)

        let aboutMe = elementsQuery.textViews[aboutMeIdentifier]
        aboutMe.tap()
        aboutMe.typeText(aboutMeString)

        let register = elementsQuery.buttons[registerIdentifier]
        register.tap();

        let details = XCUIApplication().staticTexts["Details"]
        XCTAssertFalse(details.exists)

        let inValidInputAlert = XCUIApplication().alerts["Invalid Input"]
        XCTAssertTrue(inValidInputAlert.exists)
        inValidInputAlert.buttons["Ok"].tap()
        XCTAssertFalse(inValidInputAlert.exists)
    }

    func testInValidStatus(){
        let statusString = ""
        let aboutMeString = "This text is a Valid About Me. This will work"
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let imageImport = elementsQuery.buttons[imageImportIdentifier]
        imageImport.tap()
        sleep(15)
        app.cells["Camera Roll"].tap()
        app.collectionViews["PhotosGridView"].children(matching: .cell).element(boundBy: 1).tap()
        sleep(1)

        let status = elementsQuery.textFields[statusIdentifier]
        status.tap()
        status.typeText(statusString)

        let aboutMe = elementsQuery.textViews[aboutMeIdentifier]
        aboutMe.tap()
        aboutMe.typeText(aboutMeString)

        let register = elementsQuery.buttons[registerIdentifier]
        register.tap();

        let details = XCUIApplication().staticTexts["Details"]
        XCTAssertFalse(details.exists)

        let inValidInputAlert = XCUIApplication().alerts["Invalid Input"]
        XCTAssertTrue(inValidInputAlert.exists)
        inValidInputAlert.buttons["Ok"].tap()
        XCTAssertFalse(inValidInputAlert.exists)
    }

    func testInValidAboutMe(){
        let statusString = "This is a Valid Status"
        let aboutMeString = ""
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let imageImport = elementsQuery.buttons[imageImportIdentifier]
        imageImport.tap()
        sleep(15)
        app.cells["Camera Roll"].tap()
        app.collectionViews["PhotosGridView"].children(matching: .cell).element(boundBy: 1).tap()
        sleep(1)

        let status = elementsQuery.textFields[statusIdentifier]
        status.tap()
        status.typeText(statusString)

        let aboutMe = elementsQuery.textViews[aboutMeIdentifier]
        aboutMe.tap()
        aboutMe.typeText(aboutMeString)

        let register = elementsQuery.buttons[registerIdentifier]
        register.tap();

        let details = XCUIApplication().staticTexts["Details"]
        XCTAssertFalse(details.exists)

        let inValidInputAlert = XCUIApplication().alerts["Invalid Input"]
        XCTAssertTrue(inValidInputAlert.exists)
        inValidInputAlert.buttons["Ok"].tap()
        XCTAssertFalse(inValidInputAlert.exists)
    }

    func testPreviousButton() {
        let previous = XCUIApplication().buttons["previousIdentifier"]
        previous.tap()

        let cancel = XCUIApplication().buttons["cancelIdentifier"]
        XCTAssertTrue(cancel.exists)
        cancel.tap()

        let login = XCUIApplication().staticTexts["LOGIN"]
        XCTAssertTrue(login.exists)
    }
}

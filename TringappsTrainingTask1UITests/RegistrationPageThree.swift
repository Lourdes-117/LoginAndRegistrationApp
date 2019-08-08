//
//  RegistrationPageThree.swift
//  TringappsTrainingTask1UITests
//
//  Created by Tringapps on 07/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest

class RegistrationScreenThree: XCTestCase {
    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    var elementsQuery: XCUIElementQuery!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

        app = XCUIApplication()
        scrollViewsQuery = app.scrollViews
        elementsQuery = scrollViewsQuery.otherElements

        let logOutButton = XCUIApplication().buttons["logoutIdentifier"]
        if(logOutButton.exists){
            print("Logging out")
            logOutButton.tap()
        }

        let firstNameIdentifier = "firstNameIdentifier"
        let lastNameIdentifier = "lastNameIdentifier"
        let dobIdentifier = "dobIdentifier"
        let emailIdentifier = "emailIdentifier"
        let phoneNumberIdentifier = "phoneNumberIdentifier"
        let passwordIdentifier = "passwordIdentifier"
        let confirmPasswordIdentifier = "confirmPasswordIdentifier"
        let addressIdentifier = "addressIdentifier"
        let continueButtonIdentifier = "continueButtonIdentifier"
        let signUpIdentifier = "signupIdentifier"


        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is a valid address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"


        let imageImportIdentifier = "imageImportIdentifier"
        let statusIdentifier = "statusIdentifier"
        let aboutMeIdentifier = "aboutMeIdentifier"
        let registerIdentifier = "registerIdentifier"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
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
        
        let statusString = "This is a Valid Status"
        let aboutMeString = "This text is a Valid About Me. This will work"
        elementsQuery = XCUIApplication().scrollViews.otherElements
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

    func testOkButton() {
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let okButton = elementsQuery.buttons["Ok"]
        okButton.tap()

        let loginText = elementsQuery.staticTexts["LOGIN"]
        XCTAssertTrue(loginText.exists)
    }

    func testPreviousButton() {

        let previousidentifierButton = app/*@START_MENU_TOKEN@*/.buttons["previousIdentifier"]/*[[".buttons[\"previousLabel\"]",".buttons[\"previousIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        previousidentifierButton.tap()
        let previousidentifierButtonPreviousScreen = app/*@START_MENU_TOKEN@*/.buttons["previousIdentifier"]/*[[".buttons[\"previousLabel\"]",".buttons[\"previousIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(previousidentifierButtonPreviousScreen.exists)
        previousidentifierButtonPreviousScreen.tap()
        let cancelButton = app/*@START_MENU_TOKEN@*/.buttons["cancelIdentifier"]/*[[".buttons[\"cancelLabel\"]",".buttons[\"cancelIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cancelButton.tap()
        let loginText = elementsQuery.staticTexts["LOGIN"]
        XCTAssertTrue(loginText.exists)
    }
}

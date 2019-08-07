//
//  RegistrationScreen.swift
//  TringappsTrainingTask1UITests
//
//  Created by Tringapps on 06/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest

class RegistrationScreenOne: XCTestCase {

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
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let logOutButton = XCUIApplication().buttons["logoutIdentifier"]
        if(logOutButton.exists){
            logOutButton.tap()
        }
        XCTAssertFalse(logOutButton.exists)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllValidFields(){

        //Valid TestCase1
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

    func testInValidfirstName(){

        //InValidInvalidTestCase 2
        let firstNameString = "First ]"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidlastName(){

        //InValidInvalidTestCase 2
        let firstNameString = "First"
        let lastNameString = "Last ]"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidDob(){

        //Valid TestCase1
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons[signUpIdentifier].tap()

        let firstName = elementsQuery.textFields[firstNameIdentifier]
        firstName.tap()
        firstName.typeText(firstNameString)

        let lastName = elementsQuery.textFields[lastNameIdentifier]
        lastName.tap()
        lastName.typeText(lastNameString)

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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidEmail(){

        //InValidInvalidTestCase 3
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "thisIsInvalid"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidPhoneNumber(){

        //InValidInvalidTestCase 4
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "234"
        let paswordString = "aq1AQ!aq1"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidPassword(){

        //InValidInvalidTestCase 2
        let firstNameString = "First ]"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "asdfadf"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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
        XCTAssertFalse(confirmPassword.isEnabled)

        let address = elementsQuery.textViews[addressIdentifier]
        address.tap()
        address.typeText(addressString)

        elementsQuery.buttons[continueButtonIdentifier].tap()

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidConfirmPassword(){

        //Valid TestCase1
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let confirmPasswordString = "asdASD123!@#"
        let addressString = "This is an address"
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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
        confirmPassword.typeText(confirmPasswordString)

        let address = elementsQuery.textViews[addressIdentifier]
        address.tap()
        address.typeText(addressString)

        elementsQuery.buttons[continueButtonIdentifier].tap()

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

    func testInValidAddress(){

        //Valid TestCase1
        let firstNameString = "First"
        let lastNameString = "Last"
        let emailIDString = "mail@gmail.com"
        let phoneNumberString = "1234567890"
        let paswordString = "aq1AQ!aq1"
        let addressString = ""
        let dateString = "9"
        let monthString = "August"
        let yearString = "1998"

        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
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

        XCTAssertTrue((app.alerts["Invalid Input"].buttons["Ok"]).exists)
        let status = XCUIApplication().scrollViews.otherElements.staticTexts["Status"]
        XCTAssertFalse(status.exists)
    }

}

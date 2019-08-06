//
//  RegistrationPageOne.swift
//  TringappsTrainingTask1Tests
//
//  Created by Tringapps on 06/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import XCTest;

@testable import TringappsTrainingTask1

class RegistrationPages: XCTestCase {
    func testValidNames() {
        var nameStatus = RegistrationPageValidation.checkName("Check")
        XCTAssertTrue(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("Check Check")
        XCTAssertTrue(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("check")
        XCTAssertTrue(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("CHECK")
        XCTAssertTrue(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("CHECK CHECK")
        XCTAssertTrue(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("check CHECK")
        XCTAssertTrue(nameStatus)
    }

    func testInValidNames() {
        var nameStatus = RegistrationPageValidation.checkName("Check1")
        XCTAssertFalse(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("Check Check@")
        XCTAssertFalse(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("check12")
        XCTAssertFalse(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("CHECK#@")
        XCTAssertFalse(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("CHECK CHECK@#2")
        XCTAssertFalse(nameStatus)

        nameStatus = RegistrationPageValidation.checkName("")
        XCTAssertFalse(nameStatus)
    }

    func testValidDateOfBirth() {
        var dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("11/11/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("1/11/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("11/1/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("1/1/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("01/11/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("11/01/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("01/01/1990")
        XCTAssertTrue(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("5/6/2010")
        XCTAssertTrue(dateOfBirthStatus)
    }

    func testInValidDateOfBirth() {
        var dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("something")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("aa/aa/aaaa")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("aa/aa/1101")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("11/11/111a")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("23222222")
        XCTAssertFalse(dateOfBirthStatus)

        dateOfBirthStatus = RegistrationPageValidation.checkDateOfBirth("!!/!!/!!!!")
        XCTAssertFalse(dateOfBirthStatus)
    }

    func testValidStatus() {
        var status = RegistrationPageValidation.checkStatus("Hello")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("Hello this is a text")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("Check 123")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("12312321")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("@##@#@@#@!#")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("Hello213123$%#$%")
        XCTAssertTrue(status)

        status = RegistrationPageValidation.checkStatus("Hello  %%^$564564%^$^$%646")
        XCTAssertTrue(status)
    }

    func testInvalidStatus(){
        var status = RegistrationPageValidation.checkStatus("")
        XCTAssertFalse(status)

        status = RegistrationPageValidation.checkStatus("This is a very long text, and this should not be accepted as a status by the applicaiton")
        XCTAssertFalse(status)
    }
}

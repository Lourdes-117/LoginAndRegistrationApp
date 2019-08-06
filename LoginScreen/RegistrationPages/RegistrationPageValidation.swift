//
//  RegistrationPageValidation.swift
//  TringappsTrainingTask1
//
//  Created by Tringapps on 06/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class RegistrationPageValidation {
    
    public class func checkTextView(_ text:String) -> Bool {
        let isValid = text != ""
        return isValid
    }

    public class func checkName(_ name:String) -> Bool {
        let isValid = FormatChecking.isValidFormat(textToCheck: name, format: Regex.NAME.rawValue)
        return isValid
    }

    public class func checkDateOfBirth(_ dateOfBirth:String) -> Bool{
        let isValid = FormatChecking.isValidFormat(textToCheck: dateOfBirth, format: Regex.DATE_OF_BIRTH.rawValue)
        return isValid
    }

    public class func checkEmail(_ email:String) -> Bool{
        let isValid = FormatChecking.isValidFormat(textToCheck: email, format: Regex.EMAIL.rawValue)
        return isValid
    }

    public class func checkPhoneNumber(_ number:String) -> Bool{
        let isValid = FormatChecking.isValidFormat(textToCheck: number, format: Regex.PHONE_NUMBER.rawValue)
        return isValid
    }

    public class func checkStatus(_ status:String) -> Bool{
        let isValid = FormatChecking.isValidFormat(textToCheck: status, format: "([\\s\\S]){1,30}")
        return isValid
    }
}

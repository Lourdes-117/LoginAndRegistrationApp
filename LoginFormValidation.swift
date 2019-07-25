//
//  LoginFormValidation.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class LoginFormValidation {

    public class func validateAllFilds(enteredUserName:String, enteredPassword:String) -> String? {
        let userNameValidityStatus:String? = isUserNameValid(enteredUserName: enteredUserName)
        if let userNameValidityStatusUnwrapped = userNameValidityStatus {
            return userNameValidityStatusUnwrapped
        }

        let passwordValidityStatus:String? = isPasswordValid(enteredPassword: enteredPassword)
        if let passwordValidityStatusUnwrapped = passwordValidityStatus {
            return passwordValidityStatusUnwrapped
        }
        return nil
    }

    public class func isUserNameValid(enteredUserName: String)-> String? {
        if enteredUserName == "" {
            print("⚠️ UserName cannot be empty")
            return "⚠️ UserName cannot be empty"
        }
        var isUserNameValid: Bool
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: "[0-9]{10}") || isUserNameValid
        if !isUserNameValid {
            print("⚠️ UserName is not valid")
            return "⚠️ UserName is not valid"
        }
        return nil
    }

    public class func isPasswordValid(enteredPassword:String) -> String? {

        if enteredPassword == "" {
            print("⚠️ Password cannot be empty")
            return "⚠️ Password cannot be empty"
        }
        let isPasswordValid: Bool
        isPasswordValid = FormatChecking.isValidFormat(textToCheck: enteredPassword, format: "(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#$^+=!*()@%&]).{8,}")
        if !isPasswordValid {
            print("⚠️ Password is Weak")
            return "⚠️ Password is Weak"
        }
        return nil
    }
}

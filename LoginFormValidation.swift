//
//  LoginFormValidation.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class LoginFormValidation {

    public class func validateAllFilds(enteredUserName:String, enteredPassword:String) -> String {
        let userNameValidityStatus:String? = isUserNameValid(enteredUserName: enteredUserName)
        if let userNameValidityStatusUnwrapped = userNameValidityStatus {
            return userNameValidityStatusUnwrapped
        }

        let passwordValidityStatus:String? = isPasswordValid(enteredPassword: enteredPassword)
        if let passwordValidityStatusUnwrapped = passwordValidityStatus {
            return passwordValidityStatusUnwrapped
        }

        let authenticationStatus:Bool = authenticateAccount(enteredUserName, enteredPassword);
        if(authenticationStatus){
            return enteredUserName
        }
        return LoginStatus.ACCOUNT_NOT_FOUND.rawValue
    }

    public class func isUserNameValid(enteredUserName: String)-> String? {
        if enteredUserName == "" {
            print(LoginStatus.USERNAME_EMPTY.rawValue)
            return LoginStatus.USERNAME_EMPTY.rawValue
        }
        var isUserNameValid: Bool
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: "[0-9]{10}") || isUserNameValid
        if !isUserNameValid {
            print(LoginStatus.USERNAME_INVALID.rawValue)
            return LoginStatus.USERNAME_INVALID.rawValue
        }
        return nil
    }

    public class func isPasswordValid(enteredPassword:String) -> String? {

        if enteredPassword == "" {
            print(LoginStatus.EMPTY_PASSWORD.rawValue)
            return LoginStatus.EMPTY_PASSWORD.rawValue
        }
        let isPasswordValid: Bool
        isPasswordValid = FormatChecking.isValidFormat(textToCheck: enteredPassword, format: "(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#$^+=!*()@%&]).{8,}")
        if !isPasswordValid {
            print(LoginStatus.PASSWORD_WEAK.rawValue)
            return LoginStatus.PASSWORD_WEAK.rawValue
        }
        return nil
    }

    private class func authenticateAccount(_ userName:String, _ password:String) -> Bool {
        if(userName == "abc@tringapps.com" && password == "Pass@123"){
            return true
        }
        return false
    }
}

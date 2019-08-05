//
//  LoginFormValidation.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class LoginFormValidation {

    public class func validateAllFilds(enteredUserName:String, enteredPassword:String) -> Bool {
        let userNameValidityStatus:String? = isUserNameValid(enteredUserName: enteredUserName)
        if userNameValidityStatus != nil {
            return false
        }

        let passwordValidityStatus:String? = isPasswordValid(enteredPassword: enteredPassword)
        if passwordValidityStatus != nil {
            return false
        }

        let authenticationStatus:Bool = authenticateAccount(enteredUserName, enteredPassword);
        if(authenticationStatus){
            return true
        }
        return false
    }

    public class func isUserNameValid(enteredUserName: String)-> String? {
        if enteredUserName == "" {
            print(LoginStatus.USERNAME_EMPTY.rawValue)
            return LoginStatus.USERNAME_EMPTY.rawValue
        }
        var isUserNameValid: Bool
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: Regex.EMAIL.rawValue)
        isUserNameValid = FormatChecking.isValidFormat(textToCheck: enteredUserName, format: Regex.PHONE_NUMBER.rawValue) || isUserNameValid
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
        isPasswordValid = FormatChecking.isValidFormat(textToCheck: enteredPassword, format: Regex.STRONG_PASSWORD.rawValue)
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

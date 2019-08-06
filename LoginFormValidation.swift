//
//  LoginFormValidation.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
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
            print(LoginStatus.PASSWORD_EMPTY.rawValue)
            return LoginStatus.PASSWORD_EMPTY.rawValue
        }
        let isPasswordTooLong:Bool = FormatChecking.isValidFormat(textToCheck: enteredPassword, format: Regex.PASSWORD_LENGTH.rawValue)
        if(!isPasswordTooLong) {
            print(LoginStatus.PASSWORD_LONG.rawValue)
            return LoginStatus.PASSWORD_LONG.rawValue
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
    
    public class func setPasswordStrength(enteredPassword textField_Password:UITextField, passwordStrengthIndicator label_PasswordStrengthIndicator:UILabel) -> Bool {
        let passwordStrength = LoginFormValidation.isPasswordValid(enteredPassword: textField_Password.text!)
        label_PasswordStrengthIndicator.isHidden = false
        guard let passwordStrengthUnwrapped = passwordStrength else {
            label_PasswordStrengthIndicator.text! = LoginStatus.PASSWORD_STRONG.rawValue
            label_PasswordStrengthIndicator.textColor = Colors.GREEN
            textField_Password.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
            return true;
        }
        if(passwordStrengthUnwrapped == LoginStatus.PASSWORD_EMPTY.rawValue) {
            label_PasswordStrengthIndicator.textColor = Colors.RED
            textField_Password.setBottomBorder(withColor: Colors.RED.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        } else if(passwordStrengthUnwrapped == LoginStatus.PASSWORD_WEAK.rawValue){
            label_PasswordStrengthIndicator.textColor = Colors.YELLOW
            textField_Password.setBottomBorder(withColor: Colors.YELLOW.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        } else {
            label_PasswordStrengthIndicator.textColor = Colors.RED
            textField_Password.setBottomBorder(withColor: Colors.RED.cgColor)
            label_PasswordStrengthIndicator.text! = passwordStrengthUnwrapped
        }
        return false
    }
}

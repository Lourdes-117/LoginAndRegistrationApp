//
//  Strings.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 02/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

enum LoginStatus:String {
    case PASSWORD_WEAK = "⚠️ Password is Weak";
    case PASSWORD_STRONG = "Password is Strong"
    case PASSWORD_EMPTY = "⚠️ Password cannot be empty"
    case PASSWORD_LONG = "⚠️ Password Very Long"
    case USERNAME_INVALID = "⚠️ UserName is not valid"
    case ACCOUNT_NOT_FOUND = "⚠️ Account Not Found"
    case USERNAME_EMPTY = "⚠️ UserName cannot be empty"
}

enum RegistrationStatus:String {
    case VALID_FIELD = "Valid"
    case INVALID_FIELD = "Invalid"
    case PASSWORD_MATCH = "Password Match"
    case PASSWORD_MISMATCH = "Password Mismatch"
}

enum SavedVariables:String {
    case LOGGED_IN_USERNAME = "UserName"
}

enum Regex:String {
    case EMAIL = "[A-Z0-9a-z._-]+@[A-Za-z]+\\.[A-Za-z]{2,64}"
    case PHONE_NUMBER = "[0-9]{10}"
    case STRONG_PASSWORD = "(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#$^+=!*()@%&]).{8,20}"
    case PASSWORD_LENGTH = "[\\S]{1,20}"
    case NAME = "([A-Za-z\\s]){1,}"
    case DATE_OF_BIRTH = "(([0-9]{1,2})[//]([0-9]{1,2})[//]([0-9]{1,4}))"
}

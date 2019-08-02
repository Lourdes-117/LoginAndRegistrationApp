//
//  Strings.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 02/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

enum LoginStatus:String {
    case PASSWORD_WEAK = "⚠️ Password is Weak";
    case EMPTY_PASSWORD = "⚠️ Password cannot be empty"
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

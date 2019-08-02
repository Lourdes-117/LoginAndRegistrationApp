//
//  FormatChecking.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class FormatChecking {
    public class func isValidFormat(textToCheck:String, format:String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", format)
        return emailPred.evaluate(with: textToCheck)
    }
}

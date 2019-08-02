//
//  StatusSetter.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 02/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
class StatusSetter {
    public class func setStatus(forLabel label:UILabel,ofTextField textField: UITextField?, ofTextView textView:UITextView?, validityStatus IsValid:Bool) {
        label.isHidden = false
        if(IsValid) {
            label.text! = RegistrationStatus.VALID_FIELD.rawValue
            label.textColor = Colors.GREEN
            guard let textFieldUnwrapped = textField else {
                textView!.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
                return
            }
            textFieldUnwrapped.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
        } else {
            label.text! = RegistrationStatus.INVALID_FIELD.rawValue
            label.textColor = Colors.RED
            guard let textFieldUnwrapped = textField else {
                textView!.setBottomBorder(withColor: Colors.RED.cgColor)
                return
            }
            textFieldUnwrapped.setBottomBorder(withColor: Colors.RED.cgColor)
        }
    }
}

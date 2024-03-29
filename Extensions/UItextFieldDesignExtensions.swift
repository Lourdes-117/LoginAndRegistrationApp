//
//  textFieldBottomBorderExtension.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 25/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setBottomBorder(withColor borderColorToSet: CGColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor

        self.layer.masksToBounds = false
        self.layer.shadowColor = borderColorToSet
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }

    func applyTextFieldTheme(){
        self.setBottomBorder(withColor: Colors.DARK_BLUE.cgColor)
    }
}

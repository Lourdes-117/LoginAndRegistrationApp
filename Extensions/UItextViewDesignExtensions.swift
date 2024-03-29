//
//  textViewDesignExtensions.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 02/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
extension UITextView {
    func setBottomBorder(withColor borderColorToSet: CGColor) {
        self.layer.backgroundColor = UIColor.white.cgColor

        self.layer.masksToBounds = false
        self.layer.shadowColor = borderColorToSet
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

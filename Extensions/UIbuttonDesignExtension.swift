//
//  buttonExtension.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 02/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
extension UIButton {
    func applyButtonTheme() {
        self.layer.cornerRadius = (self.frame.height/2)
        self.setGradientBackground(startColor: Colors.DARK_BLUE, endColor: Colors.LIGHT_BLUE)
    }
}

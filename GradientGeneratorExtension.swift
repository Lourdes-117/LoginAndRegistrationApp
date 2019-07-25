//
//  GradientGenerator.swift
//  LoginScreen
//
//  Created by Tringapps on 22/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackground(startColor:UIColor, endColor:UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

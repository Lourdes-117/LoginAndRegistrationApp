//
//  RegistrationPage1Class.swift
//  Tringapps-Training-Task1
//
//  Created by Tringapps on 25/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
class RegistrationPage1Class: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View has been loaded")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View has appeared")
    }
    @IBAction func onClick(_ sender: Any) {
        print("Button has been clicked")
    }
}

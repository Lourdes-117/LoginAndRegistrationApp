//
//  WelcomeScreen.swift
//  LoginScreen
//
//  Created by Tringapps on 19/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
class WelcomeScreenClass : UIViewController {
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("Welcome Screen Appeared")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Welcome Screen Popped from Stack")
    }
}

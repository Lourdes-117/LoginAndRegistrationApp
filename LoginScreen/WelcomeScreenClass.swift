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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View has been loaded")
    
    }
    @IBAction func onClickLogOut(_ sender: Any) {
        print("LogOut has been Clicked")
        let loginDetails = UserDefaults.standard
        loginDetails.set(nil, forKey: "UserName")

        guard let _ = self.presentingViewController else {
            print("Presenting View Controller")
            performSegue(withIdentifier: "LoginScreenPopOverSegue", sender: self)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Welcome Screen Safe From Memoy Leaks")
    }
}

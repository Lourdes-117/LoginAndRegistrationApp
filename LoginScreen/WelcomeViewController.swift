//
//  WelcomeScreen.swift
//  LoginScreen
//
//  Created by Tringapps on 19/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
import UIKit
class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View has been loaded")
    
    }
    @IBAction func onClickLogOut(_ sender: Any) {       //This Page has a bug
        print("LogOut has been Clicked")
        let loginDetails = UserDefaults.standard
        loginDetails.set(nil, forKey: SavedVariables.LOGGED_IN_USERNAME.rawValue)

        guard let _ = self.presentingViewController else {
            print("Presenting View Controller")
            performSegue(withIdentifier: "LoginScreenSegue", sender: self)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Welcome Screen Safe From Memoy Leaks")
    }
}

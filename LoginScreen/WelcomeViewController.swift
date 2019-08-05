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
//
//        guard let _ = self.presentingViewController else {
//            print("Changing RootView Controller To Login Screen")
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginScreenIdentifier") as UIViewController
//            UIApplication.shared.keyWindow?.rootViewController = viewController;
//            return;
//        }
//        self.dismiss(animated: true, completion: nil)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginScreenIdentifier") as UIViewController
        UIApplication.shared.keyWindow?.rootViewController = viewController;
    }

    deinit {
        print("Welcome Screen Safe From Memoy Leaks")
    }
}

//
//  AppDelegate.swift
//  LoginScreen
//
//  Created by Tringapps on 17/07/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("Application Launched")
        checkIfUserIsLoggedIn()

        return true
    }

    private func checkIfUserIsLoggedIn(){
        print("Checking login details")
        let loginDetails = UserDefaults.standard
        let userName = loginDetails.string(forKey: "UserName")
        guard  let userNameUnWrapped = userName else {
            print("No user is logged In")
            return
        }
        print("\(userNameUnWrapped) Has Logged In")
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeScreen = storyBoard.instantiateViewController(withIdentifier: "WelcomeScreenIdentifier") as! WelcomeScreenClass
        self.window?.rootViewController = welcomeScreen
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("Application Resigned Being Active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("Application Entered Background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("Application Entered Foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("Application is Active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("Application Terminated")
    }


}


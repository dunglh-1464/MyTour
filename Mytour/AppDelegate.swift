//
//  AppDelegate.swift
//  Mytour
//
//  Created by le.huu.dung on 6/4/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let accessToken = UserDefaults.standard.object(forKey: "token")
        if accessToken != nil {
            self.window?.rootViewController = RootMainController.sharedInstance
        }
        
        FirebaseApp.configure()
        ApplicationDelegate
            .shared
            .application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options:[UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
        return handled
    }
}


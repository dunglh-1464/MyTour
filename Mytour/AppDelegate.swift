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
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var tabbarCustom: TripTabbarController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
//        let accessToken = UserDefaults.standard.object(forKey: "token")
//        if accessToken != nil {
//            self.window?.rootViewController = RootMainController.sharedInstance
//        }
        
        FirebaseApp.configure()
        ApplicationDelegate
            .shared
            .application(application, didFinishLaunchingWithOptions: launchOptions)
        
//        let mainStoryboard = UIStoryboard(name: "Login" , bundle: nil)
//        tabbarCustom = mainStoryboard.instantiateViewController(withIdentifier: "TabViewController") as? TripTabbarController
//        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
//            self.window?.rootViewController = self.tabbarCustom
//        }, completion: { completed in
//            // maybe do something here
//        })
//        window!.makeKeyAndVisible()
        
        if AccessToken.current != nil {
            self.window?.rootViewController = RootMainController.sharedInstance
            self.window?.makeKeyAndVisible()
            
        }
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options:[UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
        return handled
    }
}


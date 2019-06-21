//
//  TripTabbarController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/21/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class TripTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    let arrTitle:[String] = ["Tab1","Tab2", "Tab3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        self.delegate = self
        self.tabBar.tintColor = #colorLiteral(red: 0.3790055811, green: 0.3797804117, blue: 0.9981335998, alpha: 1)
        self.tabBar.barTintColor = UIColor.white
    }
    
}

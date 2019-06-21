//
//  MainController.swift
//  Mytour
//
//  Created by le.huu.dung on 6/7/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class RootMainController: UINavigationController {
    static var sharedInstance: RootMainController = {
//        let mainTabBarController = MainTabarViewController(nibName: "MainTabarViewController", bundle: nil)
//        let instance = RootMainController.init(rootViewController: mainTabBarController)
        
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let screenTab = sb.instantiateViewController(withIdentifier: "TabViewController") as! UITabBarController
        let instance = RootMainController.init(rootViewController: screenTab)
        return instance
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
    }

}

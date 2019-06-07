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
        let instance = RootMainController.init(rootViewController: BaseStoryboard.viewController(.Login))

        return instance
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
    }

}

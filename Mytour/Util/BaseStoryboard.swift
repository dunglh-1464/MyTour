//
//  BaseStoryboard.swift
//  Mytour
//
//  Created by le.huu.dung on 6/7/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import Foundation
import UIKit

struct BaseStoryboard {
    enum ViewContollerIdentifier: String {
        case Login = "MainTabarController"
    }
    
    static func viewController(_ id: ViewContollerIdentifier) -> UIViewController {
        let storyboard = UIStoryboard.init(id: .LoginStoryboard)
        return storyboard.instantiateViewController(withIdentifier: id.rawValue)
    }
}

extension UIStoryboard {
    enum Id: String {
        case LoginStoryboard = "Login"
    }
    
    convenience init(id: Id) {
        self.init(name: id.rawValue, bundle: nil)
    }
    
    static func initialViewController(_ id: Id) -> UIViewController? {
        return UIStoryboard(id: id).instantiateInitialViewController()
    }
}

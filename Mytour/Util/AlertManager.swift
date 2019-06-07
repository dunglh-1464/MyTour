//
//  AlertManager.swift
//  Mytour
//
//  Created by le.huu.dung on 6/7/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import Foundation
import UIKit

class AlertManager {
    static func showAlertPleaseWait(_ parentController: UIViewController) {
        let alert = UIAlertController(title: nil,
                                      message: "Please wait...",
                                      preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .gray
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        parentController.present(alert, animated: true, completion: nil)
    }
    
    static func messeageError(title: String? = "",
                              message: String? = "",
                              okButton: String? = "",
                              parentController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okButton, style: .default, handler: nil))
        parentController.present(alert, animated: true, completion: nil)
    }
    
    static func alertMesseage(title: String? = "",
                              message: String,
                              okButton: String? = "",
                              cancelButton: String? = "",
                              parentController: UIViewController,
                              handleOk: (() -> Void)? = nil,
                              handleCancel: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okButton, style: .default, handler: { (alertAction) in
            if handleOk != nil {
                handleOk!()
            }
        }))
        alert.addAction(UIAlertAction(title: cancelButton, style: .default, handler: { (alertAction) in
            if handleCancel != nil {
                handleCancel!()
            }
        }))
       
        parentController.present(alert, animated: true, completion: nil)
        
    }
    
    static func dismiss(_ parentController: UIViewController) {
        parentController.dismiss(animated: true, completion: nil)
    }
}

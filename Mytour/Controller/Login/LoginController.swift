//
//  ViewController.swift
//  Mytour
//
//  Created by le.huu.dung on 6/4/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginController: UIViewController {
    
    struct TextLogin {
        static let messageLogin = "Để đảm bảo an toàn cho chuyến đi của bạn và người khác, việc cung cấp thông tin là cần thiết. Thông tin này sẽ được chúng tôi giữ kín và không cung cấp cho một bên thứ 3."
        static let failAcessToken = "Failed to get access token"
        static let ok = "OK"
        static let titleError = "Error"
        static let addNow = "Thêm ngay"
        static let addLater = "Thêm sau"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginFacebook(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                AlertManager
                    .messeageError(title: TextLogin.titleError,
                                           message: error.localizedDescription,
                                           okButton: TextLogin.ok,
                                           parentController: self)
                return
            }
            guard let accessToken = AccessToken.current else {
                AlertManager
                    .messeageError(title: "",
                                   message: TextLogin.failAcessToken,
                                   okButton: TextLogin.ok,
                                   parentController: self)
                return
            }
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            AlertManager.showAlertPleaseWait(self)
            Auth.auth().signInAndRetrieveData(with: credential) { (user, error) in
                if let error = error {
                    AlertManager
                        .messeageError(title: TextLogin.titleError,
                                               message: error.localizedDescription,
                                               okButton: TextLogin.ok, parentController: self)
                    return
                }
                AlertManager.dismiss(self)
                AlertManager
                    .alertMesseage(title: "",
                                           message: TextLogin.messageLogin,
                                           okButton: TextLogin.addNow,
                                           cancelButton: TextLogin.addLater,
                                           parentController: self, handleOk: {
                                            if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
                                                appdelegate.window?.rootViewController = RootMainController.sharedInstance
                                            }
                                            
                }, handleCancel: {
                    // Not Action
                })
            }
        }
    }
}


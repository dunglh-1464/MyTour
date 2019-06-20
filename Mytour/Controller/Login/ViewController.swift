//
//  ViewController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/19/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        controller.view.frame = self.view.frame
        self.view.addSubview(controller.view)
        self.addChild(controller)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

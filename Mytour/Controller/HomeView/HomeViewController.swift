//
//  HomeViewController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/19/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - OUTLET
    
    @IBOutlet private weak var textFieldSearch: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var viewInputSearch: UIView!
    
    // MARK: - PROPERTY
    
    private var controller: HomeController?
    private var listTrip: [Trip] = []
    var arrTrip: [Trip] = []
    
    
    
    // MARK: - Methods
    
    public func nib() -> UINib? {
        return UINib.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        setupViews()
        controller = HomeController(tableView: tableView, textField: textFieldSearch, arrTrip: arrTrip)
        hideKeyboard()
        controller?.clickDetail = {(detailTrip: Trip) in
            print("detailTrip")
            let storyBoard = UIStoryboard(name: "Login", bundle: nil)
            let detailController = storyBoard.instantiateViewController(withIdentifier: "TripDetailTabbarViewController") as! TripDetailTabbarViewController
            self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setupViews() {
        
        self.navigationBar?.isHidden = true
        textFieldSearch.becomeFirstResponder()
        viewInputSearch.layer.cornerRadius = 6
        viewInputSearch.layer.borderWidth = 1
        viewInputSearch.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8941176471, blue: 0.9019607843, alpha: 1)
        
    }
    
    @IBAction private func clickButtonAdd(_ sender: Any) {
        
        
    }
    
    private func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
}

extension HomeViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // im my example the desired view controller is the second one
        // it might be different in your case...
        let secondVC = tabBarController.viewControllers?[3] as! UINavigationController
        secondVC.popToRootViewController(animated: false)
    }
}

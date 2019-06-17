//
//  MainTabarViewController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class MainTabarViewController: UIViewController {
    
    // MARK: - OUTLET
    
    @IBOutlet private weak var textFieldSearch: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var viewInputSearch: UIView!
    
    // MARK: - PROPERTY
    
    private var controller: MainTabarController?
    private var listTrip: [Trip] = []
    var arrTrip: [Trip] = []
    
    
    // MARK: - Methods
    
    public func nib() -> UINib? {
        return UINib.init(nibName: String(describing: MainTabarViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        controller = MainTabarController(tableView: tableView, textField: textFieldSearch, arrTrip: arrTrip)
        hideKeyboard()
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

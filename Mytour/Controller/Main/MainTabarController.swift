//
//  MainTabarController.swift
//  Mytour
//
//  Created by le.huu.dung on 6/7/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class MainTabarController: NSObject {
    
    // MARK: - ENUM
    
    private enum Section: Int {
        case upComing = 0
        case tookPlace = 1
        
        static var count: Int {
            return 2
        }
    }
    
    private var tableView = UITableView()
    private var inputTextField = UITextField()
    private var searchTimer: Timer?
    private var currentKeyword: String = ""
    private var arrTrip = [InfoTour]()
    private var listTrip: [InfoTour] = []
    private var categoryArr:  [Int: [InfoTour]] = [
        0: [InfoTour(nameTrip: "Mũi Né", imageUrl: "https://www.flightnetwork.com/worlds-best-beaches/wp-content/uploads/2018/11/header-city-beach50.jpg", date: "10/6-15/6"),
            InfoTour(nameTrip: "Quy Nhơn  ", imageUrl: "https://www.flightnetwork.com/worlds-best-beaches/wp-content/uploads/2018/11/header-city-beach50.jpg", date: "10/6-15/6")],
        1: [InfoTour(nameTrip: "Phú Quốc", imageUrl: "https://r-ec.bstatic.com/images/hotel/max1024x768/137/137579816.jpg", date: "10/6-15/6"),
            InfoTour(nameTrip: "Đà Nẵng", imageUrl: "https://static.mytour.vn/upload_images/Image/Location/29_9_2015/7-du-lich-pho-co-hoi-an-mytour-6.jpg", date: "10/6-15/6")
        ]]
    
    override init() {
        super.init()
    }
    
    convenience init(tableView: UITableView, textField: UITextField, arrTrip: [InfoTour]) {
        self.init()
        self.tableView = tableView
        self.setUpTableView()
        self.setupData()
        self.inputTextField = textField
        self.inputTextField.delegate = self
        self.inputTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        listTrip = arrTrip
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.registerCellNib(cellClass: TripsCell.self)
        
    }
    
    private func setupData() {
        let trip1 = InfoTour(nameTrip: "Mũi Né", imageUrl: "https://www.flightnetwork.com/worlds-best-beaches/wp-content/uploads/2018/11/header-city-beach50.jpg", date: "10/6-15/6")
        let trip2 = InfoTour(nameTrip: "Quy Nhơn  ", imageUrl: "https://www.flightnetwork.com/worlds-best-beaches/wp-content/uploads/2018/11/header-city-beach50.jpg", date: "10/6-15/6")
        let trip3 = InfoTour(nameTrip: "Phú Quốc", imageUrl: "https://r-ec.bstatic.com/images/hotel/max1024x768/137/137579816.jpg", date: "10/6-15/6")
        let trip4 = InfoTour(nameTrip: "Đà Nẵng", imageUrl: "https://static.mytour.vn/upload_images/Image/Location/29_9_2015/7-du-lich-pho-co-hoi-an-mytour-6.jpg", date: "10/6-15/6")
        arrTrip = [trip1, trip2, trip3, trip4]
        
    }
    
    
    @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
        if searchTimer != nil {
            searchTimer?.invalidate()
            searchTimer = nil
        }
        searchTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(searchFromTimer(_:)), userInfo: textField.text, repeats: false)
    }
    
    @objc private func searchFromTimer(_ timer: Timer) {
        guard let keyword = timer.userInfo as? String else { return }
        searchForKeyword(keyword: keyword)
    }
    
    private func searchForKeyword(keyword: String) {
        currentKeyword = keyword
        
        print("Searching for keyword \(keyword)")
        if keyword != "" {
            
        }
    }
}

extension MainTabarController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return categoryArr[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {return TripsCell()}
//        switch section {
//        case .upComing:
//            return cellForTrips(atIndexpath: indexPath)
//        case .tookPlace:
//            return cellForTrips(atIndexpath: indexPath)
//        }
        return cellForTrips(atIndexpath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else {return ""}
        
        switch section {
        case .upComing:
            return "Chuyến đi sắp diễn ra"
        case .tookPlace:
            return "Chuyến đi đã diễn ra"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryArr.count
    }
    
    
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView.init()
//        view.backgroundColor = UIColor.clear
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//
    
//    func getListItem() -> [InfoTour] {
//        return listTrip
//    }
    
    private func cellForTrips(atIndexpath indexPath: IndexPath) -> TripsCell {
        let item = categoryArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(type: TripsCell.self, for: indexPath)
        cell.configureData(item)
        return cell
    }
    
}

extension MainTabarController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let keyword = textField.text {
            searchTimer?.invalidate()
            searchTimer = nil
            searchForKeyword(keyword: keyword)
        }
        textField.resignFirstResponder()
        return true
    }
}



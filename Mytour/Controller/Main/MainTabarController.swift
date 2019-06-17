//
//  MainTabarController.swift
//  Mytour
//
//  Created by le.huu.dung on 6/7/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class MainTabarController: NSObject {
    
    // MARK: - ENUM
    private enum Section: Int {
        case upComing = 0
        case tookPlace = 1
        
        static var count: Int {
            return 2
        }
    }
    
    // MARK: - Properties
    
    private var tableView = UITableView()
    private var inputTextField = UITextField()
    private var searchTimer: Timer?
    private var currentKeyword: String = ""
    private var arrTrip = [Trip]()
    private var listTrip: [Trip] = []
    private var upComingArr = [Trip]()
    private var tookPlaceArr = [Trip]()
    
    private var trips: [Trip] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override init() {
        super.init()
    }
    
    convenience init(tableView: UITableView, textField: UITextField, arrTrip: [Trip]) {
        self.init()
        self.tableView = tableView
        self.setUpTableView()
        self.inputTextField = textField
        self.inputTextField.delegate = self
        self.inputTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        
        let db = Firestore.firestore()
        db.collection("trip").getDocuments() { (querySnapshot, err) in
            guard let snapshot = querySnapshot else {
                print("Error fetching documents results: \(err!)")
                return
            }
            
            let results = snapshot.documents.map { (document) -> Trip in
                if let trip = Trip(dictionary: document.data(), id: document.documentID) {
                    return trip
                } else {
                    fatalError("Unable to initialize type \(Trip.self) with dictionary \(document.data())")
                }
            }
            self.filterCategoryTrip(trips: results)
        }
        listTrip = arrTrip
    }
    
    // MARK: - Methods
    
    func filterCategoryTrip(trips: [Trip]) {
        for trip in trips {
            if String.compareWithTheUpcommingDay(startString: trip.startString) == true {
                upComingArr.append(trip)
            } else if String.compareWithTookPlaceDay(startString: trip.startString, endString: trip.endString) == true {
                tookPlaceArr.append(trip)
            }
        }
        self.tableView.reloadData()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.registerCellNib(cellClass: TripsCell.self)
        
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

// MARK: - Extensions

extension MainTabarController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //        func getListItem() -> [Trip] {
    //            return listTrip
    //        }
    
    private func cellForTrips(atIndexpath indexPath: IndexPath) -> TripsCell {
        //        let item = trips[indexPath.row]
        let cell = tableView.dequeueReusableCell(type: TripsCell.self, for: indexPath)
        guard let section = Section(rawValue: indexPath.section) else {return TripsCell()}
        switch section {
        case .upComing:
            if indexPath.row == 0 {
                cell.configureData(self.upComingArr)
            }
        case .tookPlace:
            if indexPath.row == 0 {
                cell.configureData(self.tookPlaceArr)
            }
        }
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



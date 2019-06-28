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
import SVProgressHUD

class HomeController: NSObject {
    
    // MARK: - ENUM
    private enum Section: Int  {
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
    private var refreshControl = UIRefreshControl()
    private var scrollView: UIScrollView!
    private let db = Firestore.firestore()
    
    
    
    
    private var trips: [Trip] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var clickDetail: ((_ detailTrip: Trip) -> Void)?
    
    struct HomeSession {
        static let upComming = "Chuyến đi sắp diễn ra"
        static let tookPlace = "Chuyến đi đã diễn ra"
    }
    
    override init() {
        super.init()
    }
    
    func loadData() {
        SVProgressHUD.show()
        db.collection("trip").getDocuments() { (querySnapshot, err) in
            guard let snapshot = querySnapshot else {
                print("Error fetching documents results: \(err!)")
                return
            }
            
            self.fillDataToTableView(snapshot: snapshot)
            SVProgressHUD.dismiss()
        }
        listTrip = arrTrip
    }
    
    func fillDataToTableView(snapshot : QuerySnapshot) {
        let results = snapshot.documents.map { (document) -> Trip in
            if let trip = Trip(dictionary: document.data(), id: document.documentID) {
                return trip
            } else {
                fatalError("Unable to initialize type \(Trip.self) with dictionary \(document.data())")
            }
        }
        self.filterCategoryTrip(trips: results)
    }
    
    convenience init(tableView: UITableView, textField: UITextField, arrTrip: [Trip], scrollView: UIScrollView) {
        self.init()
        self.tableView = tableView
        self.scrollView = scrollView
        self.setUpTableView()
        self.inputTextField = textField
        self.inputTextField.delegate = self
        self.inputTextField.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        loadData()
        setupRefresh()
        
        // add listener snapshot
        let db = Firestore.firestore()
        db.collection("trip").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print("fetch error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let snapshot = snapshot else { return }
            self.fillDataToTableView(snapshot: snapshot)
        }
    }
    
    // MARK: - Methods
    
    func setupRefresh() {
        refreshControl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshControl.tintColor = #colorLiteral(red: 0.3790055811, green: 0.3797804117, blue: 0.9981335998, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Loading DATA...")
        refreshControl.addTarget(self, action: #selector(refreshDidChange), for: .valueChanged)
//        scrollView.refreshControl = refreshControl
    }
    
    @objc func refreshDidChange() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.db.collection("trip").addSnapshotListener { (snapshot, error) in
                if error != nil {
                    print("fetch error: \(String(describing: error?.localizedDescription))")
                    return
                }
                guard let snapshot = snapshot else { return }
                self.fillDataToTableView(snapshot: snapshot)
            }
            self.refreshControl.endRefreshing()
        }
    }
    
        func filterCategoryTrip(trips: [Trip]) {
            upComingArr.removeAll()
            tookPlaceArr.removeAll()
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
            tableView.registerCellNib(cellClass: CollectionViewTripCell.self)
            tableView.refreshControl = refreshControl
            
        }
        
        @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
            if let searchTimer = searchTimer  {
                searchTimer.invalidate()
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
                //TODO
            }
        }
    }
    
    // MARK: - Extensions
    
    extension HomeController: UITableViewDataSource, UITableViewDelegate {
        
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
                return HomeSession.upComming
            case .tookPlace:
                return HomeSession.tookPlace
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
        
        private func cellForTrips(atIndexpath indexPath: IndexPath) -> CollectionViewTripCell {
            let cell = tableView.dequeueReusableCell(type: CollectionViewTripCell.self, for: indexPath)
            guard let section = Section(rawValue: indexPath.section) else {return CollectionViewTripCell()}
            if indexPath.row == 0 {
                switch section {
                case .upComing:
                    cell.configureData(self.upComingArr)
                case .tookPlace:
                    cell.configureData(self.tookPlaceArr)
                }
            }
            cell.detailTrip = {(tripDetail)in
                if let clickDetail =  self.clickDetail  {
                    clickDetail(tripDetail)
                }
            }
            return cell
        }
    }
    
    extension HomeController: UITextFieldDelegate {
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



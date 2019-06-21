//
//  TripDetailViewController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    var navBar : UINavigationBar?
    let navItem = UINavigationItem()
    private var arrSub = [DetailTrip]()
    
    // MARK: - Methods
    
    public func nib() -> UINib? {
        return UINib.init(nibName: String(describing: TripDetailViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
}

private extension TripDetailViewController {
    func setupSubViews()  {
        setupData()
        setUpTableView()
        setupNav()
    }
    
    func setupNav()  {
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ViewManager.screenWidth(), height: 44))
        self.view.addSubview(navBar!)
        navBar!.barTintColor = .white
        navBar!.backgroundColor = ViewManager.blueCol
        navBar?.pushItem(navItem, animated: true)
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ViewManager.blueCol, NSAttributedString.Key.font: UIFont(name: "HiraKakuPro-W6", size: 16)! ]
        navBar!.isTranslucent=false
        
        let titleDict = [NSAttributedString.Key.foregroundColor: ViewManager.blueCol]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        self.navigationItem.hidesBackButton = false
        
        self.navigationController?.isNavigationBarHidden = true
        
        let imgBack:UIImage = (UIImage(named: "nav_back")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))!
        
        let btnLeftBar = UIBarButtonItem(image: imgBack, style: .plain, target: self, action: #selector(self.backAction))
        btnLeftBar.tintColor = ViewManager.blueCol
        navItem.setLeftBarButton(btnLeftBar, animated: true)
        
        navItem.title = "Hành trình Tây Bắc"
        navItem.titleView?.tintColor = ViewManager.blueCol
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.registerCellNib(cellClass: TripDetailCell.self)
    }
    
    private func setupData() {
        let subDetail1 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Người tạo chuyến đi", title2: "Nguyễn Văn Tuấn")
        let subDetail2 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí dự kiến", title2: "900.000 VNĐ")
        let subDetail3 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí thực tế", title2: "1.000.000 VNĐ")
        let subDetail4 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Phương tiện", title2: "Xe máy,xe đạp,ô tô")
        let subDetail5 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Thành viên", title2: "20 người")
        let subdDetail6 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "600 Km")
        arrSub = [subDetail1, subDetail2, subDetail3, subDetail4, subDetail5, subdDetail6]
    }
}

extension TripDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func deleteAndSortItem(arrSub: [DetailTrip]) {
        self.arrSub = arrSub
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSub.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = arrSub[indexPath.row]
        let cell = tableView.dequeueReusableCell(type: TripDetailCell.self, for: indexPath)
        cell.configureData(item)
        return cell
    }
}

//
//  TripDetailViewController.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import ParallaxHeader



class TripDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var headerImageView: UIView?
    
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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Trip")
        imageView.contentMode = .scaleAspectFill
        
        headerImageView = imageView
        
        tableView.parallaxHeader.view = imageView
        tableView.parallaxHeader.height = 300
        tableView.parallaxHeader.minimumHeight = 20
        tableView.parallaxHeader.mode = .fill
        tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            print(parallaxHeader.progress)
        }
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
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.tabbarCustom?.selectedIndex = 0
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
        let subDetail1 = DetailTrip(thumbnail: "http://static.asiawebdirect.com/m/bangkok/portals/vietnam/homepage/mui-ne/top10/10-phan-thiet-attractions/pagePropertiesImage/mui-ne-beach.jpg", title1: "Người tạo chuyến đi", title2: "Nguyễn Văn Tuấn")
        let subDetail2 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí dự kiến", title2: "900.000 VNĐ")
        let subDetail3 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí thực tế", title2: "1.000.000 VNĐ")
        let subDetail4 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Phương tiện", title2: "Xe máy,xe đạp,ô tô")
        let subDetail5 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Thành viên", title2: "20 người")
        let subdDetail6 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "600 Km")
         let subdDetail7 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Trạng thái chuyến đi", title2: "Công Khai")
         let subdDetail8 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Điểm đầu", title2: "KeangNam Phạm Hùng")
         let subdDetail9 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Giờ xuất phát", title2: "28/6/2018 7.00h AM")
         let subdDetail10 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Điểm đến", title2: "Hội An")
         let subdDetail11 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Giờ đến nơi", title2: "12.00h AM")
         let subdDetail12 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Hoạt động", title2: "Nghỉ ngơi")
         let subdDetail13 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Hoạt Động", title2: "Ăn uống vui trơi")
         let subdDetail14 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "800 Km")
         let subdDetail15 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "900 Km")
         let subdDetail16 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "1000 Km")
         let subdDetail17 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "2000 Km")
         let subdDetail18 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "3000 Km")
         let subdDetail19 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "4000 Km")
         let subdDetail20 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "5000 Km")
         let subdDetail21 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "6000 Km")
         let subdDetail22 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "7000 Km")
         let subdDetail23 = DetailTrip(thumbnail: "https://www.flightnetwork.com/worlds-best-beaches/wp-content/uploads/2018/11/header-city-beach50.jpg ", title1: "Quãng đường", title2: "8000 Km")
        arrSub = [subDetail1, subDetail2, subDetail3, subDetail4, subDetail5, subdDetail6, subdDetail7, subdDetail8, subdDetail9, subdDetail10, subdDetail11, subdDetail12,subdDetail13 ,subdDetail14 ,subdDetail15,subdDetail16 ,subdDetail17 ,subdDetail18,subdDetail19 ,subdDetail20 ,subdDetail21 ,subdDetail22 ,subdDetail23]
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

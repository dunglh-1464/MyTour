//
//  TripsCell.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import Reusable

class TripsCell: UITableViewCell {
    
    @IBOutlet private weak var itemCollectionView: UICollectionView!

    
    var trips =  [InfoTour]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCell()
        
    }
    
    func configCell()  {
        itemCollectionView.register(cellType: DetailTourCell.self)
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(_ data: [InfoTour]?) {
        if let data = data {
        
            self.trips = data
        }
    }
    
}

// MARK: COLLECTION VIEW

extension TripsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailTourCell", for: indexPath) as! DetailTourCell
        cell.configureData(trips[indexPath.row])
//        cell.fill(track: tracks[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let didSelected = didSelected {
//            didSelected(tracks[indexPath.row])
//        }
//    }
}

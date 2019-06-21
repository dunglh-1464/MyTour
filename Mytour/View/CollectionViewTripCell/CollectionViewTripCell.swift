//
//  TripsCell.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import Reusable

class CollectionViewTripCell: UITableViewCell {
    
    @IBOutlet private weak var itemCollectionView: UICollectionView!

    
    var trips =  [Trip]()
    var detailTrip: ((_ trip: Trip) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCell()
        
    }
    
    func configCell()  {
        itemCollectionView.register(cellType: HomeDetailCell.self)
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(_ data: [Trip]?) {
        if let data = data {
        
            self.trips = data
            self.itemCollectionView.reloadData()
        }
    }
    
}

// MARK: COLLECTION VIEW

extension CollectionViewTripCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDetailCell", for: indexPath) as! HomeDetailCell
        cell.configureData(trips[indexPath.row])

        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
//        let detailController = storyBoard.instantiateViewController(withIdentifier: "ViewController_2") as? ViewController_2
        if detailTrip != nil {
            detailTrip!(trips[indexPath.row])
        }
    
        
    }
    
}

//
//  DetailTourCell.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class DetailTourCell: UICollectionViewCell,NibReusable {
    
    // MARK: - OUTLET

    @IBOutlet weak var imgThumbnail: ImageViewBorder!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameTrip: UILabel!
    
    
    // MARK: - Properties
    
    private var tour: InfoTour?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureData(_ data: InfoTour) {
        self.imgThumbnail.sd_setImage(with: URL(string: data.imageUrl), placeholderImage: nil)
        self.tour = data
        self.nameTrip.text = data.nameTrip
        self.dateLabel.text = data.date
    }
    
    

}

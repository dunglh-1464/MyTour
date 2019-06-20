//
//  TripDetailCell.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

class TripDetailCell: UITableViewCell {

    // MARK: - OUTLET
    @IBOutlet private weak var imgThumbnail: UIImageView!
    @IBOutlet private weak var lbTitle: UILabel!
    @IBOutlet private weak var lbSubTitle: UILabel!
    @IBOutlet private weak var imgArrow: UIImageView!
    
    // MARK: - Properties
    private var item: DetailTrip?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    // MARK: - Methods
  
    private func setupView() {
        imgThumbnail.layer.cornerRadius = imgThumbnail.frame.height / 2
        imgThumbnail.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8941176471, blue: 0.9019607843, alpha: 1)
        imgThumbnail.layer.borderWidth = 1
    }
    
    func configureData(_ data: DetailTrip) {
        self.imgThumbnail.sd_setImage(with: URL(string: data.thumbnail), placeholderImage: nil)
        self.item = data
        self.lbTitle.text = data.title1
        self.lbSubTitle.text = data.title2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
}

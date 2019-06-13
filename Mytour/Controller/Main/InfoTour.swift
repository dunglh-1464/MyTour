//
//  InfoTour.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import Foundation

enum Trips: Int {
    case upComing = 0
    case tookPlace = 1
}

class InfoTour {
    var nameTrip: String = ""
    var imageUrl: String = ""
    var date: String = ""
    
    init(nameTrip: String, imageUrl: String, date: String) {
        self.nameTrip = nameTrip
        self.imageUrl = imageUrl
        self.date = date
    }
    
}


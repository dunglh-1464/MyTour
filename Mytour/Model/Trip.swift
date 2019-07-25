//
//  Trip.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/14/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import Foundation
import Firebase

class Trip {
    var startString : String
    var endString: String
    var name: String
    var thumbnail: String
    var id: String
 
    
    init(name: String, thumbnail: String, id: String, start: Timestamp, end: Timestamp) {
        print("Date Trip: \(start)")
        self.name = name
        self.thumbnail = thumbnail
        self.id = id
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-dd-MM"
        self.startString = dateFormater.string(from: start.dateValue())
        print("StartDate: \(startString)")
//        dateFormater.timeStyle = .none
//        dateFormater.dateStyle = .medium
        // dateFormater.locale = Locale(identifier: "vi")
        self.endString = dateFormater.string(from: end.dateValue())
        
    
    }
}

extension Trip {
    convenience init?(dictionary: [String: Any], id: String) {
        guard let end = dictionary["end"] as? Timestamp,
        let name = dictionary["name"] as? String,
        let start = dictionary["start"] as? Timestamp,
        let thumbnail = dictionary["thumbnail"] as? String
            else {
                return nil
                
        }
        self.init(name: name, thumbnail: thumbnail, id: id, start: start  , end: end )
    }
}

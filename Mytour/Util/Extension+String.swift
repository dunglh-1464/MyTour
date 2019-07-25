//
//  Extension+String.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/17/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import Foundation
import UIKit

extension String {
    static func compareWithTheUpcommingDay(startString: String) -> Bool {
        guard let startDate = startString.stringToDate() else {
            return false
        }
        let currentDate = Date()
        
        if startDate > currentDate {
            return true
        }
        return false
    }
    
    static func compareWithTookPlaceDay(startString: String, endString: String) -> Bool {
        let currentDate = Date().timeIntervalSince1970
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-dd-MM"
        let startDate = formatter.date(from: startString)?.timeIntervalSince1970 ?? 0
        let endDate = formatter.date(from: endString)?.timeIntervalSince1970 ?? 0
        
        if startDate < currentDate && endDate > currentDate {
            return true
        }
        return false
    }
    
    func stringToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-dd-MM"
        return formatter.date(from: self)
    }
    
}

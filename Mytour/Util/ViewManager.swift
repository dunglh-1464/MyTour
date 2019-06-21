//
//  ViewManager.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

struct ViewManager {
    
    // --------------- color
    static let blkCol = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
    static let redCol = UIColor(red: 204/255, green: 20/255, blue: 29/255, alpha: 1)
    static let navyCol = UIColor(red: 6/255, green: 21/255, blue: 51/255, alpha: 1)
    static let lightnavyCol = UIColor(red: 14/255, green: 53/255, blue: 127/255, alpha: 1)
    static let blueCol = UIColor(red: 15/255, green: 53/255, blue: 128/255, alpha: 1)
    static let lightBlue = UIColor(red: 36/255, green: 101/255, blue: 1, alpha: 1)
    
    // gray
    static let gry51Col = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    static let gry102Col = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    static let gry120Col = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
    static let gry153Col = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    static let gry187Col = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
    static let gry204Col = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
    static let gry221Col = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    static let gry227Col = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
    static let gry238Col = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    static let gry245Col = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    
    // sns
    static let twCol = UIColor(red: 85/255, green: 172/255, blue: 238/255, alpha: 1)
    static let fbCol = UIColor(red: 59/255, green: 87/255, blue: 157/255, alpha: 1)
    
    // --------------- CGFloat
    static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
    static func navigationBarHeight(callFrom: UIViewController) -> CGFloat {
        return callFrom.navigationController?.navigationBar.frame.size.height ?? 44
    }
    static let categoryBarHeight:CGFloat = 40
    
    //
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    static func viewWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width-20
    }
    static func detailScreenHeight() -> CGFloat {
        return screenHeight() - 20.0 - 44.0 - categoryBarHeight
    }
    static let detailFooterHeight: CGFloat = 47.0
    static var tabBarHeight:CGFloat = 49
    
    // --------------- margin
    static let marginBottomHeight:CGFloat = 20
    
    static let isIphone                       = UIDevice.current.userInterfaceIdiom == .phone
    static let isIphone5OrLess                = (isIphone && screenHeight() < 667.0)
    static let isIphone5                      = (isIphone && screenHeight() == 568.0)
    static let isIphone4                      = (isIphone && screenHeight() == 480.0)
    static let isIphone6PLUS                  = (isIphone && screenHeight() == 736.0)
    static let isIphone6                      = (isIphone && screenHeight() == 667.0)
    static let isIphoneX                      = (isIphone && screenHeight() == 812.0)
    
}

enum ColorConfig {
    static let spDarkBlue: UIColor = #colorLiteral(red: 0.05490196078, green: 0.2078431373, blue: 0.4980392157, alpha: 1)
    static let spBlueCompetition : UIColor = #colorLiteral(red: 0.07450980392, green: 0.2196078431, blue: 0.5058823529, alpha: 1)
    static let spRedColor: UIColor = #colorLiteral(red: 0.8, green: 0.07843137255, blue: 0.1137254902, alpha: 1)
    static let spDarkColor: UIColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
    static let spBGLodeo: UIColor = #colorLiteral(red: 0.005168255168, green: 0, blue: 0.4194402825, alpha: 1)
    static let spDarkGray: UIColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    static let spBackgroundTop: UIColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 0.968627451, alpha: 1)
    static let spWhiteColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let spTopSeparator: UIColor = #colorLiteral(red: 0.8509803922, green: 0.8941176471, blue: 0.9019607843, alpha: 1)
    static let shadowColor: UIColor = #colorLiteral(red: 0.3278842038, green: 0.5972405486, blue: 0.6329549842, alpha: 1)
    
}

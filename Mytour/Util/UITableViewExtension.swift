//
//  UITableViewExtension.swift
//  Mytour
//
//  Created by nguyen.trong.hieu on 6/13/19.
//  Copyright © 2019 le.huu.dung. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCellClass(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewClass(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerCell<T: UITableViewCell>(cellType: T.Type, changeXibName: Bool = false) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func registerCells<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { registerCell(cellType: $0) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueResuableHeaderFooterView<T: UIView>(type: T.Type) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T
    }
}

extension String {
    
    static func className(aClass: AnyClass) -> String {
        let separators = CharacterSet(charactersIn: ".")
        return NSStringFromClass(aClass).components(separatedBy: separators).last!
    }
}

extension NSObject {
    
    public var className:String {
        return type(of: self).className
    }
    public static var className: String {
        return String.className(aClass: self)
    }
}


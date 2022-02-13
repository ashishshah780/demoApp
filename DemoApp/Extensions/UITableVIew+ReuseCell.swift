//
//  UITableVIew+ReuseCell.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell \(T.reuseIdentifier)")
        }
        return cell
    }
    
}

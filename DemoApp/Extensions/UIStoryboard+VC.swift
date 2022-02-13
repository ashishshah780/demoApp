//
//  UIStoryboard.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        UIStoryboard(name: "Main", bundle: nil)
    }
    
    static func instantiate<VC: UIViewController>(_ type: VC.Type) -> VC {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: VC.self)) as! VC
    }
}

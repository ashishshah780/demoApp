//
//  String+Locaizable.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

extension String {
    
    static var ok: String { return "ok".localized() }
    static var error: String { return "error".localized() }
    static var cancel: String { return "cancel".localized() }
    static var alertTitle: String { return "alert".localized() }
    
    static var loginErrorMessage: String { return "loginErrorMessage".localized() }
    static var noResultFoundMessage: String { return "noResultFoundMessage".localized() }
}

extension String {
    
    func localized(_ tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: .main, value: "*NoValueForKey -> \(self)", comment: "")
    }
    
    func localized(_ tableName: String = "Localizable", arguments: [CVarArg]) -> String {
        return String(format: self.localized(tableName), arguments: arguments)
    }
}

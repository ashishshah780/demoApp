//
//  String+EmailRegex.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

private extension String {
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
}

extension String {
    
    var validEmailId: Bool {
        
        guard !self.isEmpty else { return false }

        do {
            let regex = try NSRegularExpression(pattern: .emailRegex, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
}

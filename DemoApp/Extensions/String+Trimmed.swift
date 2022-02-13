//
//  String+Trimmed.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

extension String {
    var trimmed: String { return trimmingCharacters(in: .whitespacesAndNewlines) }
}

//
//  TextFieldValidator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

protocol TextFieldValidator {
    func validate(_ field: String?) -> Bool
}

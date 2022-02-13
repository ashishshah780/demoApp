//
//  PasswordFieldValidator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

struct PasswordFieldValidator: TextFieldValidator {
    func validate(_ password: String?) -> Bool {
        (password ?? "").trimmed.isEmpty
    }
}

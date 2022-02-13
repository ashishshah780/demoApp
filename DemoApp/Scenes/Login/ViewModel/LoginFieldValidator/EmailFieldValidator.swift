//
//  EmailFieldValidator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

struct EmailFieldValidator: TextFieldValidator {
    func validate(_ email: String?) -> Bool {
        (email ?? "").validEmailId
    }
}

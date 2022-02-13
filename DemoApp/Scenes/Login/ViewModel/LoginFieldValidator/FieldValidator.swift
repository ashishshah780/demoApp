//
//  FieldValidator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

enum FieldValidatorType {
    case email
    case password
}

enum FildValidatorErrorType: Error {
    case emptyEmail
    case incorrectEmail
    case emptyPassword
    case incorrectPassword
}

protocol FieldValidator {
    func validate(type: FieldValidatorType, _ field: String?) throws -> Bool
}

struct DefaultFieldValidator: FieldValidator {
    
    func validate(type: FieldValidatorType, _ field: String?) throws -> Bool {
        
        var validator: TextFieldValidator!
        switch type {
        case .email:
            validator = EmailFieldValidator()
        case .password:
            validator = PasswordFieldValidator()
        }
        return validator.validate(field)
    }
}

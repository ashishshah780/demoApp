//
//  LoginModel.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

protocol LoginRequest: Encodable {
    var email: String? { get }
    var password: String? { get }
}



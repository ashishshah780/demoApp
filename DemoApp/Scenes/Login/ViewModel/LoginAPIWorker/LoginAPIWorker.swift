//
//  LoginAPIWorker.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

protocol LoginAPIWorker {
    func login(with request: LoginRequest, completion: (Bool, Error?) -> Void)
}

struct DefaultLoginAPIWorker: LoginAPIWorker {
    
    func login(with request: LoginRequest, completion: (Bool, Error?) -> Void) {
        //API Call here
        //...
        //Considering success call here
        completion(true, nil)
    }
}

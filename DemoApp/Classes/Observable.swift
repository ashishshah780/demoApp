//
//  Observable.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

class Observable<T> {
    
    private var handler: ((T?) -> Void)?
    
    var value: T? {
        didSet {
            handler?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(handler: ((T?) -> Void)?) {
        self.handler = handler
        handler?(value)
    }
}

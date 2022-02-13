//
//  Weakfiable+Self.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

protocol Weakifiable: AnyObject {}
extension NSObject: Weakifiable {}

extension Weakifiable {
    
    func weakSelf(_ code: @escaping (Self) -> Void) -> () -> Void {
        return {[weak self] in
            guard let self = self else { return }
            code(self)
        }
    }
    
    func weakSelf<T>(_ code: @escaping (Self, T) -> Void) -> (T) -> Void {
        return {[weak self] data in
            guard let self = self else { return }
            code(self, data)
        }
    }
    
    func weakSelf<T, U>(_ code: @escaping (Self, T, U) -> Void) -> (T, U) -> Void {
        return {[weak self] data1, data2 in
            guard let self = self else { return }
            code(self, data1, data2)
        }
    }
    
    func weakSelf<T, U, V>(_ code: @escaping (Self, T, U, V) -> Void) -> (T, U, V) -> Void {
        return {[weak self] data1, data2, data3 in
            guard let self = self else { return }
            code(self, data1, data2, data3)
        }
    }
}

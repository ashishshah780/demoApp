//
//  LoginViewModel.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

protocol LoginViewModel {
    var loginSuccess: Observable<Bool> { get }
    var alertMessage: Observable<String> { get }
    func login(with email: String?, password: String?)
}

class DefaultLoginViewModel: LoginViewModel, Weakifiable {
    
    //Workers
    var validator: FieldValidator
    var loginAPIWorker: LoginAPIWorker
    
    //Observables
    var loginSuccess = Observable<Bool>(nil)
    var alertMessage = Observable<String>(nil)
    
    //Init
    init(validator: FieldValidator,
         loginAPIWorker: LoginAPIWorker) {
        self.validator = validator
        self.loginAPIWorker = loginAPIWorker
    }
    
    func login(with email: String?, password: String?) {
        
        guard validate(email: email, password: password) else {
            return
        }
        
        let loginRequest = LoginCredential(email: email, password: password)
        
        loginAPIWorker.login(with: loginRequest, completion: weakSelf {`self`, success, error in
            guard success else {
                self.alertMessage.value = error?.localizedDescription ?? .loginErrorMessage
                return
            }
            self.loginSuccess.value = success
        })
    }
    
    private func validate(email: String?, password: String?) -> Bool {
        do {
            guard try validator.validate(type: .email, email) else { return false }
            guard try validator.validate(type: .password, password) else { return false }
            return true
        } catch let error {
            debugPrint(error)
            // Can format more precise error using error enum created for fields
            alertMessage.value = .loginErrorMessage
            return false
        }
        
    }
}

//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField! // Secure field
    
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelObservers()
    }
    
    private func setupViewModelObservers() {
        
        viewModel.alertMessage.bind(handler: weakSelf {`self`, alertMessage in
            
        })
        
        viewModel.loginSuccess.bind(handler: weakSelf {`self`, loginSuccess in
            
        })
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        viewModel.login(with: emailField.text, password: passwordField.text)
    }
}

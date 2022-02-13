//
//  LoginCoordinator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import UIKit

class LoginCoordinator: Coordinator {
  
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        goToLogin()
    }

    func goToLogin() {
        let loginVC: LoginViewController = UIStoryboard.instantiate(LoginViewController.self)
        
        // Inject depencencies
        let loginFieldValidator = DefaultFieldValidator()
        let loginAPIWorker = DefaultLoginAPIWorker()
        let viewModel: LoginViewModel = DefaultLoginViewModel(validator: loginFieldValidator,
                                                              loginAPIWorker: loginAPIWorker)
        loginVC.viewModel = viewModel
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToDetails() {
        //Detail screen routing
    }
}

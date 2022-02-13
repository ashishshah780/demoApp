//
//  AppCoordinator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?

    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else {
            return
        }
        let rootViewController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: rootViewController)
        loginCoordinator.parentCoordinator = self
        
        // store child coordinator
        self.addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

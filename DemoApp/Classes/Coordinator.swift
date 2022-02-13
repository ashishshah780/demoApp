//
//  Coordinator.swift
//  DemoApp
//
//  Created by Ashish Shah on 2/13/22.
//

import Foundation

class Coordinator {
    
    weak var parentCoordinator: Coordinator?
    private(set) var childCoordinators: [Coordinator] = []

    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func finish() {
        //Optional to override
    }

    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(of: coordinator) else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
            return
        }
        childCoordinators.remove(at: index)
    }

    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }

    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }

}

extension Coordinator: Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs // Check for lhs and rhs are identical
    }
}

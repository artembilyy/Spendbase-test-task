//
//  AppCoordinator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

final class AppCoordinator: Coordinator {

    enum AppFlow {
        case main
    }

    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
//        let tabBar = assemblyBuilder.createTabBarController()
//        let tabBarContollerCoordinator = TabBarCoordinator(
//            tabBarController: tabBar,
//            assemblyBuilder: assemblyBuilder
//        )
//        addChildCoordinator(tabBarContollerCoordinator)
//        tabBarContollerCoordinator.start()
//        window?.rootViewController = tabBarContollerCoordinator.tabBarController
    }
}

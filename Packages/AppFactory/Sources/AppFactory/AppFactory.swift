//
//  AppFactory.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import EmptyFeature
import HomeFeature
import TabBarCoordinator
import UIKit

public final class AppFactory {
    private let appDependenciesAssembly = AppDependenciesAssembly.assembleDependencies()

    public init() {}
}

public extension AppFactory {
    
    private typealias EmptyFeatureType = EmptyFeatureViewController.EmptyFeatureType

    func makeTabBarCoordinator() -> TabBarCoordinator {
        let tabBarCoordinator = TabBarCoordinator()

        let homeFeatureCoordinator = makeHomeFeatureCoordinator()
        tabBarCoordinator.setupChildCoordinator(homeFeatureCoordinator)

        let transactionsCoordinator = makeEmptyFeatureCoordinator(type: .transactions)
        tabBarCoordinator.setupChildCoordinator(transactionsCoordinator)

        let myCardsCoordinator = makeEmptyFeatureCoordinator(type: .myCard)
        tabBarCoordinator.setupChildCoordinator(myCardsCoordinator)

        let accountCoordinator = makeEmptyFeatureCoordinator(type: .account)
        tabBarCoordinator.setupChildCoordinator(accountCoordinator)

        return tabBarCoordinator
    }

    private func makeHomeFeatureCoordinator() -> HomeFeatureCoordinator {
        let navigationController = UINavigationController()
        let coordinator = HomeFeatureCoordinator(
            navigationController: navigationController,
            dependencies: appDependenciesAssembly)
        return coordinator
    }

    private func makeEmptyFeatureCoordinator(type: EmptyFeatureType) -> EmptyFeatureCoordinator {
        let navigationController = UINavigationController()
        let coordinator = EmptyFeatureCoordinator(navigationController: navigationController, type: type)
        return coordinator
    }
}

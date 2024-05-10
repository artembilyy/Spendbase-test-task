//
//  TabBarCoordinator.swift
//  App
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreCoordinator
import EmptyFeature
import HomeFeature
import UIKit

public final class TabBarCoordinator: Coordinator {

    public let tabBarController = TabBarController()
    public var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak public var parentCoordinator: Coordinator?

    public init() {}

    public func start() {
        addHomeTab()
        addTransactionsTab()
        addMyCardsTab()
        addAccountTab()
    }

    private func addHomeTab() {
        let tab = Tab.home
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: tab.tag)
        let coordinator = HomeFeatureCoordinator(navigationController: navigationController)
        tabBarController.viewControllers?.append(coordinator.navigationController!)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func addTransactionsTab() {
        let tab = Tab.transactions
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: tab.tag)
        let coordinator = EmptyFeatureCoordinator(navigationController: navigationController, title: tab.title)
        tabBarController.viewControllers?.append(coordinator.navigationController!)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func addMyCardsTab() {
        let tab = Tab.myCards
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: tab.title.capitalized, image: tab.image, tag: tab.tag)

        let largeTitle = tab.title.prefix(1).uppercased() + tab.title.dropFirst()

        let coordinator = EmptyFeatureCoordinator(navigationController: navigationController, title: largeTitle)
        tabBarController.viewControllers?.append(coordinator.navigationController!)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func addAccountTab() {
        let tab = Tab.account
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: tab.tag)
        let coordinator = EmptyFeatureCoordinator(
            navigationController: navigationController,
            title: tab.title)
        tabBarController.viewControllers?.append(coordinator.navigationController!)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    func deinitViewControllers() {
        tabBarController.viewControllers = []
    }
}

extension TabBarCoordinator {

    enum Tab {
        case home
        case transactions
        case myCards
        case account
        ///
        var title: String {
            switch self {
            case .home:
                return "home".capitalized
            case .transactions:
                return "transactions".capitalized
            case .myCards:
                return "my cards"
            case .account:
                return "account".capitalized
            }
        }

        var image: UIImage? {
            switch self {
            case .home:
                return UIImage(resource: .home)
            case .transactions:
                return UIImage(resource: .transactions)
            case .myCards:
                return UIImage(resource: .creditCard)
            case .account:
                return UIImage(resource: .userSquare)
            }
        }

        var tag: Int {
            switch self {
            case .home:
                return 0
            case .transactions:
                return 1
            case .myCards:
                return 2
            case .account:
                return 3
            }
        }
    }
}

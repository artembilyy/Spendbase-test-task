//
//  TabBarCoordinator.swift
//  App
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreCoordinator
import UIKit

public final class TabBarCoordinator: Coordinator {

    public let tabBarController = TabBarController()
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController?
    weak public var parentCoordinator: Coordinator?

    public init() {}

    public func start() {
        configureTabs()
    }

    public func setupChildCoordinator(_ coordinator: Coordinator) {
        guard let navigationController = coordinator.navigationController else { return }
        tabBarController.viewControllers?.append(navigationController)
        addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func configureTabs() {
        for (index, tab) in TabBarItemFactory.Tab.allCases.enumerated() {
            guard let navigationController = tabBarController.viewControllers?[index] as? UINavigationController else {
                return
            }
            navigationController.viewControllers.first?.title = tab.navigationTitle
            navigationController.tabBarItem = TabBarItemFactory.createItem(tab)
        }
    }

    private func deinitViewControllers() {
        tabBarController.viewControllers = []
    }
}

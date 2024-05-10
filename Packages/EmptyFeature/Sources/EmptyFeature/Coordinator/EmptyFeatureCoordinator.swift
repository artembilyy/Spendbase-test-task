//
//  EmptyFeatureCoordinator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreCoordinator
import UIKit

public final class EmptyFeatureCoordinator: Coordinator {

    public let navigationController: UINavigationController?
    public var childCoordinators: [Coordinator] = []
    public weak var parentCoordinator: Coordinator?

    public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    public func start() {
        let emptyFeatureViewController = EmptyFeatureViewController()
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([emptyFeatureViewController], animated: true)
    }
}

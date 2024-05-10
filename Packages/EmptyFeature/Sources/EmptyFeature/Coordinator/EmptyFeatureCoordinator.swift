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

    private let title: String

    public init(navigationController: UINavigationController?, title: String) {
        self.navigationController = navigationController
        self.title = title
    }

    public func start() {
        let emptyFeatureViewController = EmptyFeatureViewController()
        emptyFeatureViewController.title = title.capitalizingFirstLetter()
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([emptyFeatureViewController], animated: true)
    }
}

private extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

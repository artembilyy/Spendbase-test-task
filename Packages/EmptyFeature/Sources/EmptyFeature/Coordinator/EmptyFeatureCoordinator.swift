//
//  EmptyFeatureCoordinator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreCoordinator
import UIKit

public final class EmptyFeatureCoordinator: Coordinator {
    
    public typealias EmptyFeatureType = EmptyFeatureViewController.EmptyFeatureType

    public let navigationController: UINavigationController?
    public var childCoordinators: [Coordinator] = []
    public weak var parentCoordinator: Coordinator?

    private let type: EmptyFeatureType
    public init(
        navigationController: UINavigationController?,
        type: EmptyFeatureType) {
        self.navigationController = navigationController
        self.type = type
    }

    public func start() {
        let emptyFeatureViewController = EmptyFeatureViewController()
        emptyFeatureViewController.set(emptyFeatureType: type)
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([emptyFeatureViewController], animated: true)
    }
}

//
//  HomeFeatureCoordinator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreCoordinator
import UIKit

public final class HomeFeatureCoordinator: Coordinator {

//    public typealias Dependencies = HomeFeatureViewModel.Dependencies

    public let navigationController: UINavigationController?
    public var childCoordinators: [Coordinator] = []
    public weak var parentCoordinator: Coordinator?

    private let dependencies: HomeFeatureViewModel.Dependencies

    public init(navigationController: UINavigationController?, dependencies: HomeFeatureViewModel.Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    public func start() {
        let viewModel = HomeFeatureViewModel(dependencies: dependencies)
        let homeFeatureViewController = HomeFeatureViewController(viewModel: viewModel)
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([homeFeatureViewController], animated: true)
    }
}

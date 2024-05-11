//
//  HomeFeatureCoordinator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import Combine
import CoreCoordinator
import MoneyTransferFeature
import UIKit

public final class HomeFeatureCoordinator: Coordinator {

    public typealias Dependencies =
        HomeFeatureViewModel.Dependencies &
        MoneyTransferViewModel.Dependencies

    public let navigationController: UINavigationController?
    public var childCoordinators: [Coordinator] = []
    public weak var parentCoordinator: Coordinator?

    private var subscriptions = Set<AnyCancellable>()

    private let dependencies: Dependencies

    public init(navigationController: UINavigationController?, dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    public func start() {
        let viewModel = HomeFeatureViewModel(dependencies: dependencies)

        viewModel.presentMoneyTrasferObservable.sink(receiveValue: { _ in
            self.startMoneyTrasferCoordinator()
        })
        .store(in: &subscriptions)

        let homeFeatureViewController = HomeFeatureViewController(viewModel: viewModel)
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setViewControllers([homeFeatureViewController], animated: true)
    }

    private func startMoneyTrasferCoordinator() {
        let coordinator = MoneyTransferFeatureCoordinator(dependencies: dependencies)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

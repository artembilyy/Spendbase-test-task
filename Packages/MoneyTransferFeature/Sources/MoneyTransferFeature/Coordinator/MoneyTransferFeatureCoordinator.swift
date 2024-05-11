//
//  MoneyTransferFeatureCoordinator.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import Combine
import CoreCoordinator
import UIKit

public final class MoneyTransferFeatureCoordinator: Coordinator {

    public var childCoordinators: [Coordinator] = []
    public var parentCoordinator: Coordinator?
    public var navigationController: UINavigationController?

    private let dependencies: MoneyTransferViewModel.Dependencies

    private var subscriptions = Set<AnyCancellable>()

    public init(dependencies: MoneyTransferViewModel.Dependencies) {
        self.dependencies = dependencies
    }

    public func start() {
        let viewModel = MoneyTransferViewModel(dependencies: dependencies)

        viewModel
            .crossButtonInteractionObservable
            .sink { [unowned self] _ in
                navigationController?.dismiss(animated: true)
                finish()
            }
            .store(in: &subscriptions)

        viewModel
            .ctaButtonInteractionObservable
            .sink { [unowned self] _ in
                navigationController?.dismiss(animated: true)
                finish()
            }
            .store(in: &subscriptions)

        let viewController = MoneyTransferViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        guard let navigationController else { return }
        parentCoordinator?.navigationController?.present(navigationController, animated: true)
    }
}

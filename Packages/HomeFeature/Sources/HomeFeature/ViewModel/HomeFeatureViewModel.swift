//
//  HomeFeatureViewModel.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataFetcher
import CardDataStorage
import Combine
import UserCardsAPI

public final class HomeFeatureViewModel {

    public typealias Dependencies =
        CardDataFetcherContainer &
        CardDataStorageContainer

    enum LoadingState {
        case start
        case success
        case failure(Error)
    }

    var cardBalance: CardBalanceModel? {
        dependencies.cardDataStorage.userBalance
    }

    var cardsResponse: CardsModel? {
        dependencies.cardDataStorage.userCards
    }

    var transactionsResponse: TransactionsModel? {
        dependencies.cardDataStorage.userTransactions
    }

    private(set) var loadingState = PassthroughSubject<LoadingState, Never>()

    private let dependencies: Dependencies
    private var subscriptions = Set<AnyCancellable>()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func fetchAllData() {
        loadingState.send(.start)
        Task {
            try await Task.sleep(nanoseconds: 3_500_000_000)
            dependencies
                .cardDataFetcheServicer
                .fetchAllData()
                .sink(receiveCompletion: { [unowned self] completion in
                    switch completion {
                    case .finished:
                        loadingState.send(.success)
                    case .failure(let error):
                        loadingState.send(.failure(error))
                    }
                }, receiveValue: {})
                .store(in: &subscriptions)

        }
    }
}

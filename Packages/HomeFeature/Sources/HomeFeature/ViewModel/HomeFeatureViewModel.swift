//
//  HomeFeatureViewModel.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataFetcher
import CardDataStorage
import Combine
import UIKit
import UserCardsAPI

public final class HomeFeatureViewModel {

    public typealias Dependencies =
        CardDataFetcherContainer &
        CardDataStorageContainer

    enum SectionType {
        case cardBalance
        case cardsResponse
        case transactionsResponse

        var title: String {
            switch self {
            case .cardsResponse:
                return "My cards"
            case .transactionsResponse:
                return "Recent transactions"
            default:
                return ""
            }
        }
    }

    private(set) var sectionTypes = [SectionType]()

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
    
    lazy var dataSource = HomeFeatureDataSource(viewModel: self)

    private(set) var loadingState = PassthroughSubject<LoadingState, Never>()
    private let subjectPresentMoneyTrasfer = PassthroughSubject<Void, Never>()

    var presentMoneyTrasferObservable: AnyPublisher<Void, Never> {
        subjectPresentMoneyTrasfer.eraseToAnyPublisher()
    }

    private let dependencies: Dependencies
    private var subscriptions = Set<AnyCancellable>()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func rightBarButtonPressed() {
        subjectPresentMoneyTrasfer.send()
    }

    func fetchAllData() {
        loadingState.send(.start)
        Task {
            try await Task.sleep(nanoseconds: 2_500_000_000)
            dependencies
                .cardDataFetcheServicer
                .fetchAllData()
                .sink(receiveCompletion: { [unowned self] completion in
                    switch completion {
                    case .finished:
                        sectionsConfigure()
                        loadingState.send(.success)
                    case .failure(let error):
                        loadingState.send(.failure(error))
                    }
                }, receiveValue: {})
                .store(in: &subscriptions)
        }
    }

    private func sectionsConfigure() {
        if cardBalance != nil {
            sectionTypes.append(.cardBalance)
        }
        if cardsResponse != nil {
            sectionTypes.append(.cardsResponse)
        }
        if transactionsResponse != nil {
            sectionTypes.append(.transactionsResponse)
        }
    }
}

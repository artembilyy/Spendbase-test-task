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

    enum LoadingState {
        case start
        case success
        case failure(Error)
    }

    private enum SectionType {
        case cardBalance
        case cardsResponse
        case transactionsResponse
    }

    private var sectionTypes = [SectionType]()

    var cardBalance: CardBalanceModel? {
        //        nil
        dependencies.cardDataStorage.userBalance
    }

    var cardsResponse: CardsModel? {
        //        nil
        dependencies.cardDataStorage.userCards
    }

    var transactionsResponse: TransactionsModel? {
        //        nil
        dependencies.cardDataStorage.userTransactions
    }

    var numbersOfSection: Int {
        sectionTypes.count
    }

    func numberOfRowsInSection(section: Int) -> Int {
        guard section < sectionTypes.count else { return 0 }

        let sectionType = sectionTypes[section]
        switch sectionType {
        case .cardBalance:
            return cardBalance?.balance != nil ? 1 : 0
        case .cardsResponse:
            return (cardsResponse?.cards.count ?? 0) + 1
        case .transactionsResponse:
            return (transactionsResponse?.transactions.count ?? 0) + 1
        }
    }

    func cellConfigure(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let header: HeaderTableViewCell = tableView.dequeueReusableCell()

        let sectionType = sectionTypes[indexPath.section]

        switch sectionType {
        case .cardBalance:
            let cell: TopTableViewCell = tableView.dequeueReusableCell()
            cell.configure(balance: cardBalance)
            return cell
        case .cardsResponse:
            if indexPath.item == 0 {
                header.configure(title: "My cards")
                return header
            }
            let cell: CardTableViewCell = tableView.dequeueReusableCell()
            cell.configure(card: cardsResponse?.cards[indexPath.row - 1])
            return cell
        case .transactionsResponse:
            if indexPath.item == 0 {
                header.configure(title: "Recent transactions")
                return header
            }
            let cell: TransactionTableViewCell = tableView.dequeueReusableCell()
            cell.configure(transaction: transactionsResponse?.transactions[indexPath.row - 1])
            return cell
        }
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

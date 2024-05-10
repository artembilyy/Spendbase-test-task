//
//  ConcreteCardDataFetcher.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataStorage
import Combine
import UserCardsAPI

public final class ConcreteCardDataFetcher: CardDataFetcherService {

    public typealias Dependencies =
        CardDataServiceContainer &
        CardDataStorageContainer

    public var dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func fetchAllData() -> AnyPublisher<Void, Error> {
        let balancePublisher = fetchTotalUserBalance()
        let cardsPublisher = fetchUserCards()
        let transactionsPublisher = fetchUserTransactions()

        return Publishers.Zip3(balancePublisher, cardsPublisher, transactionsPublisher)
            .map { _, _, _ in () }
            .eraseToAnyPublisher()
    }

    public func fetchTotalUserBalance() -> AnyPublisher<CardBalanceModel, Error> {
        Future<CardBalanceModel, Error> { [unowned self] promise in
            Task {
                do {
                    let balance = try await dependencies.userCardsService.fetchTotalUserBalance()
                    dependencies.cardDataStorage.userBalance = balance
                    promise(.success(balance))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    public func fetchUserCards() -> AnyPublisher<CardsModel, Error> {
        Future<CardsModel, Error> { [unowned self] promise in
            Task {
                do {
                    let userCards = try await dependencies.userCardsService.fetchUserCards()
                    dependencies.cardDataStorage.userCards = userCards
                    promise(.success(userCards))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    public func fetchUserTransactions() -> AnyPublisher<TransactionsModel, Error> {
        return Future<TransactionsModel, Error> { [unowned self] promise in
            Task {
                do {
                    let transactions = try await dependencies.userCardsService.fetchUserTransactions()
                    dependencies.cardDataStorage.userTransactions = transactions
                    promise(.success(transactions))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

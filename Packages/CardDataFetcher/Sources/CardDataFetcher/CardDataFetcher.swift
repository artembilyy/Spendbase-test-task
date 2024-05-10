//
//  CardDataFetcher.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import Combine
import UserCardsAPI

public protocol CardDataFetcherService {
    func fetchAllData() -> AnyPublisher<Void, Error>
    func fetchTotalUserBalance() -> AnyPublisher<CardBalanceModel, Error>
    func fetchUserCards() -> AnyPublisher<CardsModel, Error>
    func fetchUserTransactions() -> AnyPublisher<TransactionsModel, Error>
}

public protocol CardDataFetcherContainer {
    var cardDataFetcheServicer: CardDataFetcherService { get }
}

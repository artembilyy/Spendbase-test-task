//
//  CardDataService.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public protocol CardDataService {
    func fetchTotalUserBalance() async throws -> CardBalanceModel
    func fetchUserCards() async throws -> CardsModel
    func fetchUserTransactions() async throws -> TransactionsModel
}

public protocol CardDataServiceContainer {
    var userCardsService: CardDataService { get }
}

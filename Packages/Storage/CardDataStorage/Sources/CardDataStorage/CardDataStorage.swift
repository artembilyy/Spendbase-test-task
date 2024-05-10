//
//  CardDataStorage.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UserCardsAPI

public protocol CardDataStorage {
    var userBalance: CardBalanceModel? { get set }
    var userCards: CardsModel? { get set }
    var userTransactions: TransactionsModel? { get set }
}

public protocol CardDataStorageContainer {
    var cardDataStorage: CardDataStorage { get set }
}

//
//  ConcreteCardDataStorage.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UserCardsAPI

public final class ConcreteCardDataStorage: CardDataStorage {
    public var userBalance: CardBalanceModel?
    public var userCards: CardsModel?
    public var userTransactions: TransactionsModel?

    public init() {}
}

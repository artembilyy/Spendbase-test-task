//
//  ModuleDependencies.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataStorage
import UserCardsAPI

public struct ModuleDependencies: ConcreteCardDataFetcher.Dependencies {
    public let userCardsService: CardDataService
    public var cardDataStorage: CardDataStorage

    public init(userCardsService: CardDataService, cardDataStorage: CardDataStorage) {
        self.userCardsService = userCardsService
        self.cardDataStorage = cardDataStorage
    }
}

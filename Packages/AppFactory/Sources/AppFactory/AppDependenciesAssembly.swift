//
//  AppDependenciesAssembly.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//
import CardDataFetcher
import CardDataStorage
import UserCardsAPI

enum AppDependenciesAssembly {

    typealias AppDependencies =
        CardDataFetcherContainer &
        CardDataServiceContainer &
        CardDataStorageContainer

    struct DependenciesContainer: AppDependencies {
        let cardDataFetcheServicer: CardDataFetcherService
        var cardDataStorage: CardDataStorage
        let userCardsService: CardDataService
    }

    static func assembleDependencies() -> DependenciesContainer {
        let token = "40IkCTQcbnZiCvEj5zg66xn0hPrTvzCe2kmn5eGEWvk"

        let cardDataStorage = ConcreteCardDataStorage()
        let userCardsService = ConcreteCardDataService(token: token)

        let cardDataFetcherDependencies = CardDataFetcher.ModuleDependencies(userCardsService: userCardsService, cardDataStorage: cardDataStorage)

        let cardDataFetcher = ConcreteCardDataFetcher(dependencies: cardDataFetcherDependencies)

        return DependenciesContainer(
            cardDataFetcheServicer: cardDataFetcher,
            cardDataStorage: cardDataStorage,
            userCardsService: userCardsService)
    }
}

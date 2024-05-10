//
//  ModuleDependencies.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataFetcher
import CardDataStorage

public struct ModuleDependencies: HomeFeatureViewModel.Dependencies {
    public var cardDataStorage: CardDataStorage
    public let cardDataFetcheServicer: CardDataFetcherService

}

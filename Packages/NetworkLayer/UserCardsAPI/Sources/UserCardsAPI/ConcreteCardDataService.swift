//
//  ConcreteCardDataService.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import CoreNetwork
import Foundation

public struct ConcreteCardDataService: HTTPClient, CardDataService {

    enum RequestType {
        case userBalance
        case userCards
        case userTransactions
    }

    private let token: String
    private let decoder = JSONDecoder()

    public init(token: String) {
        self.token = token
    }

    public func fetchTotalUserBalance() async throws -> CardBalanceModel {
        do {
            try await sendRequest(
                apiRequest: CardDataServiceRequest(
                    accessToken: token,
                    requestType: .userBalance),
                responseModel: CardBalanceModel.self,
                decoder: decoder)
            return CardBalanceModel.mockData
        } catch {
            throw error
        }
    }

    public func fetchUserCards() async throws -> CardsModel {
        do {
            try await sendRequest(
                apiRequest: CardDataServiceRequest(
                    accessToken: token,
                    requestType: .userCards),
                responseModel: CardBalanceModel.self,
                decoder: decoder)
            return CardsModel.mockData
        } catch {
            throw error
        }
    }

    public func fetchUserTransactions() async throws -> TransactionsModel {
        do {
            try await sendRequest(
                apiRequest: CardDataServiceRequest(
                    accessToken: token,
                    requestType: .userTransactions),
                responseModel: CardBalanceModel.self,
                decoder: decoder)
            return TransactionsModel.mockData
        } catch {
            throw error
        }
    }
}

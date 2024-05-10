//
//  CardsModel.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct CardsModel: Decodable {
    public let cards: [Card]

    public struct Card: Decodable {
        public let id: String
        public let cardLast4: String
        public let cardName: String
        public let isLocked: Bool
        public let isTerminated: Bool
        public let spent: Int
        public let limit: Int
        public let limitType: String
        public let cardHolder: CardHolder
        public let fundingSource: String
        public let issuedAt: String
    }

    public struct CardHolder: Decodable {
        public let id: String
        public let fullName: String
        public let email: String
        public let logoURL: String
    }
}

extension CardsModel {
    static let mockData = Self(cards: [
        Card(id: "1", cardLast4: "1234", cardName: "John Doe", isLocked: false, isTerminated: false, spent: 500, limit: 1000, limitType: "Credit", cardHolder: CardHolder(id: "1", fullName: "John Doe", email: "john.doe@example.com", logoURL: "https://example.com/logo.png"), fundingSource: "Visa", issuedAt: "2024-05-09T12:00:00Z"),
        Card(id: "2", cardLast4: "5678", cardName: "Jane Smith", isLocked: true, isTerminated: false, spent: 200, limit: 500, limitType: "Debit", cardHolder: CardHolder(id: "2", fullName: "Jane Smith", email: "jane.smith@example.com", logoURL: "https://example.com/logo.png"), fundingSource: "Mastercard", issuedAt: "2024-05-09T12:00:00Z"),
        Card(id: "3", cardLast4: "9012", cardName: "Alice Johnson", isLocked: false, isTerminated: true, spent: 100, limit: 200, limitType: "Credit", cardHolder: CardHolder(id: "3", fullName: "Alice Johnson", email: "alice.johnson@example.com", logoURL: "https://example.com/logo.png"), fundingSource: "American Express", issuedAt: "2024-05-09T12:00:00Z")
    ])
}

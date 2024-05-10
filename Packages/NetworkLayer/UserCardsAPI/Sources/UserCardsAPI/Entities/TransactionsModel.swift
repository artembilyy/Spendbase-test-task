//
//  TransactionsModel.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct TransactionsModel {

    public let transactions: [Transaction]

    public struct Transaction {
        public let id: String
        public let tribeTransactionId: String
        public let tribeCardId: Int
        public let amount: String
        public let status: String
        public let tribeTransactionType: String
        public let schemeId: String
        public let merchantName: String
        public let pan: String
    }
}

extension TransactionsModel {
    static let mockData = Self(transactions: [
        Transaction(id: "1", tribeTransactionId: "12345", tribeCardId: 1, amount: "1000", status: "Completed", tribeTransactionType: "Load", schemeId: "CASH", merchantName: "unknown", pan: "unkown"),
        Transaction(id: "2", tribeTransactionId: "67890", tribeCardId: 2, amount: "500", status: "Declined", tribeTransactionType: "Withdrawal", schemeId: "Mastercard", merchantName: "ATM", pan: "** 5678"),
        Transaction(id: "3", tribeTransactionId: "54321", tribeCardId: 1, amount: "100.00", status: "Completed", tribeTransactionType: "Purchase", schemeId: "VISA", merchantName: "Grocery Store", pan: "** 1234")
    ])
}

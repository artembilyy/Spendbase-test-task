//
//  TransactionCellStateFactory.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import CoreUI
import UIKit
import UserCardsAPI

enum TransactionCellStateFactory {

    struct TransactionProperties {
        let amountColor: UIColor
        let isSuccess: Bool
        let attachmentShouldShow: Bool
        let isLoad: Bool
        let amount: String
    }

    private static let country = "€"

    static func configure(transaction: TransactionsModel.Transaction?) -> TransactionProperties? {
        guard let transaction else { return nil }

        let amountColor = getColorForTransaction(transaction)
        let isSuccess = isSuccessTransaction(transaction)
        let attachmentShouldShow = shouldShowAttachment(for: transaction)
        let isLoad = transaction.tribeTransactionType == "Load"
        let amount = getFormattedAmountForUser(from: transaction)

        return TransactionProperties(
            amountColor: amountColor,
            isSuccess: isSuccess,
            attachmentShouldShow: attachmentShouldShow,
            isLoad: isLoad,
            amount: amount)
    }

    private static func getColorForTransaction(_ transaction: TransactionsModel.Transaction) -> UIColor {
        switch (transaction.status, transaction.tribeTransactionType) {
        case ("Completed", "Load"):
            return ThemeColor.limeGreen.asUIColor()
        case ("Declined", "Purchase"):
            return ThemeColor.grayishBlue.asUIColor()
        case ("Completed", "Purchase"):
            return ThemeColor.black.asUIColor()
        default:
            return .blue
        }
    }

    private static func isSuccessTransaction(_ transaction: TransactionsModel.Transaction) -> Bool {
        return transaction.status != "Declined" || transaction.tribeTransactionType != "Purchase"
    }

    private static func shouldShowAttachment(for transaction: TransactionsModel.Transaction) -> Bool {
        return transaction.status == "Completed" && transaction.tribeTransactionType == "Purchase"
    }

    private static func getFormattedAmountForUser(from transaction: TransactionsModel.Transaction) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en_US")
        let formattedNumber = numberFormatter.string(from: NSNumber(value: Double(transaction.amount) ?? 0))
        if transaction.tribeTransactionType == "Load" {
            return country + (formattedNumber ?? "")
        } else {
            return "-" + country + (formattedNumber ?? "")
        }
    }
}

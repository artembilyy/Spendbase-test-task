//
//  CardBalanceValueFactory.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import Foundation
import UserCardsAPI

public enum CardBalanceValueFactory {

    private static let country = "€"

    public static func configure(cardBalance: CardBalanceModel?) -> String {
        guard let cardBalance else { return "\(country)0.0" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en_US")
        let formattedNumber = numberFormatter.string(from: NSNumber(value: cardBalance.balance))
        return country + (formattedNumber ?? "0.0")
    }
}

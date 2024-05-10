//
//  CardBalanceModel.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct CardBalanceModel: Decodable {
    public let balance: Double

    public var balanceFormatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en_US")
        let formattedNumber = numberFormatter.string(from: NSNumber(value: balance))
        return "€" + (formattedNumber ?? "0")
    }
}

extension CardBalanceModel {
    static let mockData = Self(balance: 153_000.85)
}

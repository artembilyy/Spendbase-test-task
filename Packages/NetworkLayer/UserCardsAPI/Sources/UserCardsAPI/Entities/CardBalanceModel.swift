//
//  CardBalanceModel.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct CardBalanceModel: Decodable {
    public let balance: Double
}

extension CardBalanceModel {
    static let mockData = Self(balance: 10234.25)
}

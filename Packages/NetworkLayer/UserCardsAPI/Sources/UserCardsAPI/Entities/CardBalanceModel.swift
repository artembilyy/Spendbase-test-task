//
//  CardBalanceModel.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct CardBalanceModel: Decodable {
    public var balance: Double
}

extension CardBalanceModel {
    static let mockData = Self(balance: 153_000.85)
}

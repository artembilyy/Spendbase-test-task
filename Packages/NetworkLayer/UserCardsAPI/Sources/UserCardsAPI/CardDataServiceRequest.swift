//
//  CardDataServiceRequest.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import CoreNetwork
import Foundation

struct CardDataServiceRequest: APIRequest {

    let accessToken: String
    let path: String
    let header: HTTPURLHeader?
    let queryItems: [URLQueryItem]?

    init(accessToken: String, requestType: ConcreteCardDataService.RequestType) {
        self.accessToken = accessToken
        self.header = HTTPURLHeader(authorization: .bearer(token: accessToken))
        self.queryItems = [URLQueryItem(name: "teamId", value: "123456789")]

        self.path = {
            switch requestType {
            case .userBalance:
                return "/cards/account/total-balance"
            case .userCards:
                return "/cards"
            case .userTransactions:
                return "/cards/transactions"
            }
        }()
    }
}

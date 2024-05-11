//
//  HTTPURLHeader.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public struct HTTPURLHeader {

    public enum Authorization {
        typealias Key = String
        typealias Value = String

        case bearer(token: String)

        var value: String {
            switch self {
            case .bearer(let token):
                return "Bearer \(token)"
            }
        }

        var key: String {
            return "Authorization"
        }
    }

    let authorization: Authorization?

    public init(authorization: Authorization? = nil) {
        self.authorization = authorization
    }

    func toDictionary() -> [String: String] {
        var dict = [String: String]()
        if let auth = authorization {
            dict.updateValue(auth.value, forKey: auth.key)
        }
        return dict
    }
}

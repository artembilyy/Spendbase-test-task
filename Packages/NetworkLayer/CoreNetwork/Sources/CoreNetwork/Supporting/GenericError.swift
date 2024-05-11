//
//  GenericError.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public enum GenericError: Error {
    case invalidURL
    case unableCastingHTTPURLResponse
    case decodingFailure
    case serializationFailure
    case unexpectedStatusCode(_ code: String)
    case unknown

    /// `GenericError` description
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .unableCastingHTTPURLResponse:
            return "Unable casting to HTTPURLResponse"
        case .decodingFailure:
            return "Decoding failure"
        case .serializationFailure:
            return "Serialization failure"
        case .unexpectedStatusCode(let description):
            return "Unexpected status code: - \(description)"
        default:
            return "Unknown error"
        }
    }
}

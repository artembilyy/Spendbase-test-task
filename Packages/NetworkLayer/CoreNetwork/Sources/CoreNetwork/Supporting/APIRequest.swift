//
//  APIRequest.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public protocol APIRequest {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var requestMethod: APIRequestMethod { get }
    var requestTimeout: TimeInterval? { get }
    var header: HTTPURLHeader? { get }
    var queryItems: [URLQueryItem]? { get }
}

public extension APIRequest {

    var scheme: String {
        "https"
    }

    var host: String {
        "api.spendbase.co"
    }

    var header: HTTPURLHeader? {
        nil
    }

    var requestMethod: APIRequestMethod {
        .get
    }

    var requestTimeout: TimeInterval? {
        nil
    }
}

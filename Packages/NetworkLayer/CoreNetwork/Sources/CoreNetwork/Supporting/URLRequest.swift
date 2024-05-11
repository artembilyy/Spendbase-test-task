//
//  URLRequest.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

extension URLRequest {

    init(apiRequest: APIRequest) throws {
        guard let url = URLComponents(apiRequest: apiRequest).url else {
            throw GenericError.invalidURL
        }

        self.init(url: url)
        httpMethod = apiRequest.requestMethod.asHTTPMethod()

        if let header = apiRequest.header {
            allHTTPHeaderFields = header.toDictionary()
        }

        if let requestTimeout = apiRequest.requestTimeout {
            timeoutInterval = requestTimeout
        }

        switch apiRequest.requestMethod {
        case .post(let data), .put(let data), .patch(let data):
            guard let serilizationData = try? JSONSerialization.data(withJSONObject: data) else {
                throw GenericError.serializationFailure
            }
            httpBody = serilizationData
        default:
            break
        }
    }
}

private extension URLComponents {

    init(apiRequest: APIRequest) {
        self.init()
        scheme = apiRequest.scheme
        host = apiRequest.host
        path = apiRequest.path
        queryItems = apiRequest.queryItems
    }
}

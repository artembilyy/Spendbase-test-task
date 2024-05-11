//
//  APIRequestMethod.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public enum APIRequestMethod {
    case get
    case post(Data)
    case put(Data)
    case patch(Data)
    case delete

    func asHTTPMethod() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

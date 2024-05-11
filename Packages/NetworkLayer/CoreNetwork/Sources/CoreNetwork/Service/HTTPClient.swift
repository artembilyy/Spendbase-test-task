//
//  HTTPClient.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import Foundation

public protocol HTTPClient {
    func sendRequest<T: Decodable>(
        apiRequest: APIRequest,
        responseModel: T.Type,
        decoder: JSONDecoder,
        error: Error?) async throws -> T
}

public extension HTTPClient {
    @discardableResult
    func sendRequest<T: Decodable>(
        apiRequest: APIRequest,
        responseModel: T.Type,
        decoder: JSONDecoder,
        error: Error? = nil) async throws -> T {

        do {
            let request = try URLRequest(apiRequest: apiRequest)

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw GenericError.unableCastingHTTPURLResponse
            }

            guard (200 ... 299).contains(httpResponse.statusCode) else {
                throw GenericError.unexpectedStatusCode(String(httpResponse.statusCode))
            }

            guard let decodedData = try? decoder.decode(responseModel, from: data) else {
                throw GenericError.decodingFailure
            }
            return decodedData
        } catch {
            throw error
        }
    }
}

//
//  APIDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

enum APIDataStoreProvider {

    static func provide() -> APIDataStore {
        return APIDataStoreImpl(session: Session.default)
    }
}

/// @mockable
protocol APIDataStore {
    func request<T: Decodable>(_ request: APIRequestable) async throws -> T
}

private struct APIDataStoreImpl: APIDataStore {

    let session: Session

    func request<T: Decodable>(_ request: APIRequestable) async throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try await self.session.request(request.urlString, method: request.method, parameters: request.parameters)
            .serializingDecodable(T.self, decoder: decoder).value
    }
}

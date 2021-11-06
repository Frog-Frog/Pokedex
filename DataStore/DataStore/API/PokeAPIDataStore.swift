//
//  PokeAPIDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Foundation

enum PokeAPIDataStoreProvider {

    static func provide() -> PokeAPIDataStore {
        return PokeAPIDataStoreImpl(dataStore: APIDataStoreProvider.provide())
    }
}

/// @mockable
protocol PokeAPIDataStore {
    func request<T: Decodable>(_ request: PokeAPIRequestable) async throws -> T
}

struct PokeAPIDataStoreImpl: PokeAPIDataStore {

    let dataStore: APIDataStore

    func request<T: Decodable>(_ request: PokeAPIRequestable) async throws -> T {
        let data = try await self.dataStore.request(request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(T.self, from: data)
        return response
    }
}

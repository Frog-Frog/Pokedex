//
//  EvolutionChainRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

public enum EvolutionChainRepositoryProvider {

    public static func provide() -> EvolutionChainRepository {
        return EvolutionChainRepositoryImpl(apiDataStore: APIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol EvolutionChainRepository {
    func get(id: Int) async throws -> EvolutionChainResponse
}

struct EvolutionChainRepositoryImpl: EvolutionChainRepository {

    let apiDataStore: APIDataStore

    func get(id: Int) async throws -> EvolutionChainResponse {
        try await self.apiDataStore.request(EvolutionChainAPIRequest(id: id))
    }
}

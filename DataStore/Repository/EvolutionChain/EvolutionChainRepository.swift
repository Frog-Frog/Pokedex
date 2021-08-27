//
//  EvolutionChainRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

public enum EvolutionChainRepositoryProvider {

    public static func provide() -> EvolutionChainRepository {
        return EvolutionChainRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol EvolutionChainRepository {
    func get(id: Int, completion: @escaping (Result<EvolutionChainResponse, Error>) -> Void)

    @available(iOS 15.0.0, *)
    func get(id: Int) async throws -> EvolutionChainResponse
}

struct EvolutionChainRepositoryImpl: EvolutionChainRepository {

    let apiDataStore: PokeAPIDataStore

    func get(id: Int, completion: @escaping (Result<EvolutionChainResponse, Error>) -> Void) {
        self.apiDataStore.request(EvolutionChainAPIRequest(id: id), completion: completion)
    }

    @available(iOS 15.0.0, *)
    func get(id: Int) async throws -> EvolutionChainResponse {
        try await self.apiDataStore.request(EvolutionChainAPIRequest(id: id))
    }
}

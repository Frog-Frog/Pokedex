//
//  EvolutionChainRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

public enum RepositoryProvider {

    public static func provide() -> EvolutionChainRepository {
        return EvolutionChainRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide())
    }
}

public protocol EvolutionChainRepository {
    func get(id: Int, completion: @escaping (Result<EvolutionChainResponse, Error>) -> Void)
}

private struct EvolutionChainRepositoryImpl: EvolutionChainRepository {

    let apiDataStore: PokeAPIDataStore

    func get(id: Int, completion: @escaping (Result<EvolutionChainResponse, Error>) -> Void) {
        self.apiDataStore.request(EvolutionChainAPIRequest(id: id), completion: completion)
    }
}

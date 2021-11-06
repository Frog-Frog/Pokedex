//
//  PokemonListRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

public enum PokemonListRepositoryProvider {

    public static func provide() -> PokemonListRepository {
        return PokemonListRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol PokemonListRepository {
    func get() async throws -> PokemonListResponse
}

struct PokemonListRepositoryImpl: PokemonListRepository {

    let apiDataStore: PokeAPIDataStore

    func get() async throws -> PokemonListResponse {
        try await self.apiDataStore.request(PokemonListAPIRequest())
    }
}

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
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void))
}

struct PokemonListRepositoryImpl: PokemonListRepository {

    let apiDataStore: PokeAPIDataStore

    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void)) {
        self.apiDataStore.request(PokemonListAPIRequest(), completion: completion)
    }
}

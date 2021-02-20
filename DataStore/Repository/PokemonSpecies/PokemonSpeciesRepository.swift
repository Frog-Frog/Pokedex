//
//  PokemonSpeciesRepository.swift
//  DataStore
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

public enum PokemonSpeciesRepositoryProvider {

    public static func provide() -> PokemonSpeciesRepository {
        return PokemonSpeciesRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol PokemonSpeciesRepository {
    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesResponse, Error>) -> Void))
}

struct PokemonSpeciesRepositoryImpl: PokemonSpeciesRepository {

    let apiDataStore: PokeAPIDataStore

    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesResponse, Error>) -> Void)) {
        self.apiDataStore.request(PokemonSpeciesAPIRequest(number: number), completion: completion)
    }
}

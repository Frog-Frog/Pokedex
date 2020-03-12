//
//  PokemonDetailAPIGateway.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/10.
//

import Foundation

public enum PokemonDetailAPIGatewayProvider {

    public static func provide() -> PokemonDetailAPIGateway {
        return PokemonDetailAPIGatewayImpl(dataStore: PokeAPIDataStoreProvider.provide())
    }
}

public protocol PokemonDetailAPIGateway {
    func get(name: String, completion: @escaping ((Result<PokemonDetailResponse, Error>) -> Void))
}

private struct PokemonDetailAPIGatewayImpl: PokemonDetailAPIGateway {

    let dataStore: PokeAPIDataStore

    func get(name: String, completion: @escaping ((Result<PokemonDetailResponse, Error>) -> Void)) {
        self.dataStore.request(PokemonDetailRequest(name: name), completion: completion)
    }
}

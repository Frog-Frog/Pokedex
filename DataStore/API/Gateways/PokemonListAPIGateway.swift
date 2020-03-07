//
//  PokemonListAPIGateway.swift
//  API
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Entity
import Foundation

public enum PokemonListAPIGatewayProvider {
    
    public static func provide() -> PokemonListAPIGateway {
        return PokemonListAPIGatewayImpl(dataStore: PokeAPIDataStoreProvider.provide())
    }
}

public protocol PokemonListAPIGateway {
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void))
}

private struct PokemonListAPIGatewayImpl: PokemonListAPIGateway {
    
    let dataStore: PokeAPIDataStore
    
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void)) {
        self.dataStore.request(PokemonListRequest(), completion: completion)
    }
}

//
//  FavoritePokemonRepository.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import DataStore
import Foundation

enum FavoritePokemonRepositoryProvider {

    static func provide() -> FavoritePokemonRepository {
        return FavoritePokemonRepositoryImpl(gateway: FavoritePokemonRealmGatewayProvider.provide())
    }
}

protocol FavoritePokemonRepository {
    func get() -> [FavoritePokemon]
    func contains(_ pokemon: FavoritePokemon) -> Bool
    func add(_ pokemon: FavoritePokemon)
    func delete(_ pokemon: FavoritePokemon)
}

private struct FavoritePokemonRepositoryImpl: FavoritePokemonRepository {

    let gateway: FavoritePokemonRealmGateway

    func get() -> [FavoritePokemon] {
        return self.gateway.get()
    }

    func contains(_ pokemon: FavoritePokemon) -> Bool {
        return self.gateway.contains(pokemon)
    }

    func add(_ pokemon: FavoritePokemon) {
        self.gateway.add(pokemon)
    }

    func delete(_ pokemon: FavoritePokemon) {
        self.gateway.delete(pokemon)
    }
}

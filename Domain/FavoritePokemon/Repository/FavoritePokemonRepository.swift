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

    typealias Pokemon = (number: Int, name: String)

    func get() -> [FavoritePokemon]
    func contains(_ id: Int) -> Bool
    func add(_ pokemon: Pokemon)
    func delete(_ pokemon: Pokemon)
}

private struct FavoritePokemonRepositoryImpl: FavoritePokemonRepository {

    let gateway: FavoritePokemonRealmGateway

    func get() -> [FavoritePokemon] {
        return self.gateway.get()
    }

    func contains(_ id: Int) -> Bool {
        return self.gateway.contains(id)
    }

    func add(_ pokemon: Pokemon) {
        self.gateway.add(pokemon)
    }

    func delete(_ pokemon: Pokemon) {
        self.gateway.delete(pokemon)
    }
}

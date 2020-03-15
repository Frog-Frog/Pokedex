//
//  FavoritePokemonRealmGateway.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import Foundation
import RealmSwift

public enum FavoritePokemonRealmGatewayProvider {

    public static func provide() -> FavoritePokemonRealmGateway {
        return FavoritePokemonRealmGatewayImpl(dataStore: RealmDataStoreProvider.provide())
    }
}

public protocol FavoritePokemonRealmGateway {
    func get() -> [FavoritePokemon]
    func contains(_ pokemon: FavoritePokemon) -> Bool
    func add(_ pokemon: FavoritePokemon)
    func delete(_ pokemon: FavoritePokemon)
}

private struct FavoritePokemonRealmGatewayImpl: FavoritePokemonRealmGateway {

    let dataStore: RealmDataStore

    func get() -> [FavoritePokemon] {
        let results: Results<FavoritePokemon>? = self.dataStore.getObjects()
        return results?.sorted { $0.id < $1.id } ?? []
    }

    func contains(_ pokemon: FavoritePokemon) -> Bool {
        let results: Results<FavoritePokemon>? = self.dataStore.getObjects()
        return results?.contains(pokemon) ?? false
    }

    func add(_ pokemon: FavoritePokemon) {
        self.dataStore.addObject(pokemon)

    }

    func delete(_ pokemon: FavoritePokemon) {
        self.dataStore.deleteObject(pokemon)
    }
}

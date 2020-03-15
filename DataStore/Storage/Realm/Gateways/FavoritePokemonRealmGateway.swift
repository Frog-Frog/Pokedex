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

    typealias Pokemon = (number: Int, name: String)

    func get() -> [FavoritePokemon]
    func contains(_ id: Int) -> Bool
    func add(_ pokemon: Pokemon)
    func delete(_ pokemon: Pokemon)
}

private struct FavoritePokemonRealmGatewayImpl: FavoritePokemonRealmGateway {

    let dataStore: RealmDataStore

    func get() -> [FavoritePokemon] {
        let results: Results<FavoritePokemon>? = self.dataStore.getObjects()
        return results?.sorted { $0.id < $1.id } ?? []
    }

    func contains(_ id: Int) -> Bool {
        let results: Results<FavoritePokemon>? = self.dataStore.getObjects()
        return results?.contains { $0.id == id } ?? false
    }

    func add(_ pokemon: Pokemon) {
        let favoritePokemon = FavoritePokemon()
        favoritePokemon.setValue(id: pokemon.number, name: pokemon.name)
        self.dataStore.addObject(favoritePokemon)

    }

    func delete(_ pokemon: Pokemon) {
        let favoritePokemon = FavoritePokemon()
        favoritePokemon.setValue(id: pokemon.number, name: pokemon.name)
        self.dataStore.deleteObject(favoritePokemon)
    }
}

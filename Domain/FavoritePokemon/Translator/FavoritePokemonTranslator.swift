//
//  FavoritePokemonTranslator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import DataStore
import Foundation

enum FavoritePokemonTranslatorProvider {

    static func provide() -> FavoritePokemonTranslator {
        return FavoritePokemonTranslatorImpl()
    }
}

protocol FavoritePokemonTranslator {
    func convert(from pokemons: [FavoritePokemon]) -> FavoritePokemonData
    func convert(from id: Int, name: String) -> FavoritePokemon
}

private struct FavoritePokemonTranslatorImpl: FavoritePokemonTranslator {

    func convert(from pokemons: [FavoritePokemon]) -> FavoritePokemonData {
        return FavoritePokemonData(pokemons)
    }

    func convert(from id: Int, name: String) -> FavoritePokemon {
        let favoritePokemon = FavoritePokemon()
        favoritePokemon.setValue(id: id, name: name)
        return favoritePokemon
    }
}

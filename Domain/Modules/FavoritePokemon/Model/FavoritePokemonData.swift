//
//  FavoritePokemonData.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import DataStore
import Foundation

public struct FavoritePokemonData {

    public let pokemons: [Pokemon]

    init(_ pokemons: [FavoritePokemon]) {
        self.pokemons = pokemons.map { Pokemon($0) }
    }
}

extension FavoritePokemonData {

    public struct Pokemon {

        public let name: String
        public let number: Int
        public let imageUrl: String

        init(_ pokemon: FavoritePokemon) {
            self.name = pokemon.name
            self.number = pokemon.id
            self.imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(self.number).png"
        }
    }
}

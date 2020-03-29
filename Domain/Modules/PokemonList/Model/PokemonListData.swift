//
//  PokemonListData.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import DataStore
import Foundation

// MARK: - PokemonListData
public struct PokemonListData {

    public let count: Int
    public let pokemons: [Pokemon]
}

extension PokemonListData {

    init(_ response: PokemonListResponse) {
        self.count = response.count
        self.pokemons = response.results.enumerated().map { Pokemon($0.element, offset: $0.offset) }
    }
}

// MARK: - Pokemon
extension PokemonListData {

    public struct Pokemon {

        public let name: String
        public let number: Int
        public let imageUrl: String
    }
}

extension PokemonListData.Pokemon {

    init(_ pokemon: PokemonListResponse.Result, offset: Int) {
        self.name = pokemon.name
        self.number = offset + 1
        self.imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(self.number).png"
    }
}

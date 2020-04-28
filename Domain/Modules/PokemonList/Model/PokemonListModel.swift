//
//  PokemonListModel.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import DataStore
import Foundation

// MARK: - PokemonListModel
public struct PokemonListModel {

    public let count: Int
    public let pokemons: [Pokemon]
}

extension PokemonListModel {

    init(_ response: PokemonListResponse) {
        self.count = response.count
        self.pokemons = response.results.map { Pokemon($0) }
    }
}

// MARK: - Pokemon
extension PokemonListModel {

    public struct Pokemon {

        public let name: String
        public let number: Int
        public let imageUrl: String
    }
}

extension PokemonListModel.Pokemon {

    init(_ pokemon: PokemonListResponse.Result) {
        self.name = pokemon.name
        self.number = PokemonNumberGenerator.generate(from: pokemon.url)
        self.imageUrl = PokemonImageURLGenerator.generate(from: self.number)
    }
}

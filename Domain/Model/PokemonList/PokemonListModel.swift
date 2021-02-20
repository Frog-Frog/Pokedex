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

    init(_ response: PokemonListResponse) {
        self.count = response.count
        self.pokemons = response.results.map { Pokemon($0) }
    }
}

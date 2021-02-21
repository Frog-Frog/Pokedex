//
//  PokemonListModel.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

@testable import Domain

extension PokemonListModel {

    static var stub: Self {
        return .init(count: 3, pokemons: [Pokemon].stub)
    }
}

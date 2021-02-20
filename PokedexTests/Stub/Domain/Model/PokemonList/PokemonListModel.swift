//
//  PokemonListModel.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

import DataStore
@testable import Domain

extension PokemonListModel {

    static var stub: Self {
        return .init(.stub)
    }
}

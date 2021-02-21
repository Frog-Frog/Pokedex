//
//  PokemonDetailModel.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import DataStore
@testable import Domain

extension PokemonDetailModel {

    static var stub: Self {
        return .init(.bulbasaurStub)
    }
}

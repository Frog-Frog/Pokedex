//
//  Pokemon.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

import DataStore
@testable import Domain

extension Pokemon {

    static var stub: Self {
        return .init(NamedURLResource.pokemonStub)
    }
}

extension Array where Element == Pokemon {

    static var stub: Self {
        return [NamedURLResource].pokemonStub.map { Pokemon($0) }
    }
}

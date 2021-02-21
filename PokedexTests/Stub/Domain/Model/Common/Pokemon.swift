//
//  Pokemon.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

@testable import DataStore
@testable import Domain

extension Pokemon {

    static var stub: Self {
        return .init(.stub)
    }
}

private extension NamedURLResource {

    static var stub: Self {
        return .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}

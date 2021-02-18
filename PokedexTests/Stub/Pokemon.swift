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
        let resource = NamedURLResource(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")
        return Pokemon(resource)
    }
}

extension Array where Element == Pokemon {

    static var stub: Self {
        return [
            Pokemon(NamedURLResource(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")),
            Pokemon(NamedURLResource(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/1/")),
            Pokemon(NamedURLResource(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
        ]
    }
}

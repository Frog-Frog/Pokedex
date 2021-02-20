//
//  NamedURLResource.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore

extension NamedURLResource {

    static var pokemonStub: Self {
        return NamedURLResource(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}

extension Array where Element == NamedURLResource {

    static var pokemonStub: Self {
        return [
            NamedURLResource(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
            NamedURLResource(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
            NamedURLResource(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/")
        ]
    }
}

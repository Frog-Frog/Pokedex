//
//  PokemonSpeciesResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

@testable import DataStore

extension PokemonSpeciesResponse {

    static var stub: Self {
        return JsonPerser.parseJson("PokemonSpecies-Bulbasaur")
    }
}

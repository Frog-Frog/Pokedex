//
//  PokemonSpeciesResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import DataStore

extension PokemonSpeciesResponse {

    static var stub: Self {
        return JsonParser.parseJson("PokemonSpecies-Bulbasaur")
    }
}

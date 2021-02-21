//
//  PokemonListResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import DataStore

extension PokemonListResponse {

    static var stub: Self {
        return JsonParser.parseJson("PokemonList")
    }
}

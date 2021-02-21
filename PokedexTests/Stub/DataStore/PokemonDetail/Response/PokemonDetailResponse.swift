//
//  PokemonDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import DataStore

extension PokemonDetailResponse {

    static var stub: Self {
        return JsonParser.parseJson("PokemonDetail_Bulbasaur")
    }
}

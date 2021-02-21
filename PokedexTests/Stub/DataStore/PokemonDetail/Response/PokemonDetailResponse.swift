//
//  PokemonDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import DataStore

extension PokemonDetailResponse {

    static var bulbasaurStub: Self {
        return JsonParser.parseJson("PokemonDetail_Bulbasaur")
    }

    static var clefableStub: Self {
        return JsonParser.parseJson("PokemonDetail_Clefable")
    }

    static var zeraoraStub: Self {
        return JsonParser.parseJson("PokemonDetail_Zeraora")
    }
}

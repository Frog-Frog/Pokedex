//
//  PokemonDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

@testable import DataStore

extension PokemonDetailResponse {

    static var stub: Self {
        return JsonPerser.parseJson("PokemonDetail_Bulbasaur")
    }
}

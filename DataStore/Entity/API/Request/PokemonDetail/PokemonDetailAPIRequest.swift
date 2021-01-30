//
//  PokemonDetailAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/10.
//

import Foundation

struct PokemonDetailAPIRequest: PokeAPIRequestable {

    let path: String

    init(number: Int) {
        self.path = "pokemon/\(number)"
    }
}

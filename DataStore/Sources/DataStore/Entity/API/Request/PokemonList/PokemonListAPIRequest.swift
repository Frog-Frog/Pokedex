//
//  PokemonListAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

struct PokemonListAPIRequest: PokeAPIRequestable {

    var path: String = "pokemon"

    let offset: Int = 0

    let limit: Int = 1118
}

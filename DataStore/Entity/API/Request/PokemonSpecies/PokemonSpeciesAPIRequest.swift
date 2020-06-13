//
//  PokemonSpeciesAPIRequest.swift
//  DataStore
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

struct PokemonSpeciesAPIRequest: PokeAPIRequestable {

    let path: String

    init(number: Int) {
        self.path = "pokemon-species/\(number)"
    }

    init(name: String) {
        self.path = "pokemon-species/\(name)"
    }
}

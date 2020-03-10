//
//  PokemonDetailRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/10.
//

import Foundation

struct PokemonDetailRequest: PokeAPIRequestable {
    
    let urlString: String
    
    init(name: String) {
        self.urlString = "https://pokeapi.co/api/v2/pokemon/\(name)/"
    }
}

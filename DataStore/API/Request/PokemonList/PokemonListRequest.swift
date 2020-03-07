//
//  PokemonListRequest.swift
//  API
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation
import RealmSwift

struct PokemonListRequest {
    let offset: Int = 0
    let limit: Int = 1000
}

extension PokemonListRequest: PokeAPIRequestable {
    
    var urlString: String {
           return "https://pokeapi.co/api/v2/pokemon"
    }
}

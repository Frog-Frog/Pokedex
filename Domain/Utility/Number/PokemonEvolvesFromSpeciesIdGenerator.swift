//
//  PokemonEvolvesFromSpeciesIdGenerator.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

enum PokemonEvolvesFromSpeciesIdGenerator {

    static func generate(from url: String?) -> Int? {
        guard let url = url else {
            return nil
        }
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon-species/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)
    }
}

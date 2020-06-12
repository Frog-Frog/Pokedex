//
//  PokemonEvolvesFromSpeciesIdGenerator.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

enum PokemonEvolvesFromSpeciesIdGenerator {

    static func generate(from url: String) -> Int? {

        var removePrefix: String = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon-species/", with: "")

        if removePrefix.count > 1 {
            removePrefix.removeLast()
            return Int(removePrefix)
        }

        return nil
    }
}

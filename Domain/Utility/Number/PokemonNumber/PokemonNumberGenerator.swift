//
//  PokemonNumberGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/04/29.
//

import Foundation

enum PokemonNumberGenerator {

    static func generate(from url: String) -> Int {
        guard !url.isEmpty else {
            return 0
        }

        if let number = self.generate(fromPokemon: url) {
            return number
        }
        if let number = self.generate(fromPokemonSpecies: url) {
            return number
        }
        return 0
    }

    private static func generate(fromPokemon url: String) -> Int? {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)
    }

    private static func generate(fromPokemonSpecies url: String) -> Int? {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon-species/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)
    }
}

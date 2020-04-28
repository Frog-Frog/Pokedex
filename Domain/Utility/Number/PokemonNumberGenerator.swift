//
//  PokemonNumberGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/04/29.
//

import Foundation

enum PokemonNumberGenerator {

    static func generate(from url: String) -> Int {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix) ?? 0
    }
}

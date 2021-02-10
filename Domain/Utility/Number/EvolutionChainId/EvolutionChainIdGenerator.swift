//
//  EvolutionChainIdGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

enum EvolutionChainIdGenerator {

    static func generate(from url: String) -> Int {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/evolution-chain/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)!
    }
}

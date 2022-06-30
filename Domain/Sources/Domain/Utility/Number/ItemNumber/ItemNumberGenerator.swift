//
//  ItemNumberGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

enum ItemNumberGenerator {

    static func generate(from url: String) -> Int {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/item/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)!
    }
}

//
//  PokemonImageURLGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import Foundation

enum PokemonImageURLGenerator {

    static func generate(_ id: Int, type: Type) -> String {
        return type.generate(from: id)
    }
}

extension PokemonImageURLGenerator {

    enum `Type` {
        case front
        case back

        func generate(from id: Int) -> String {
            let baseURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
            switch self {
            case .front:
                return "\(baseURL)\(id).png"
            case .back:
                return "\(baseURL)back/\(id).png"
            }
        }
    }
}

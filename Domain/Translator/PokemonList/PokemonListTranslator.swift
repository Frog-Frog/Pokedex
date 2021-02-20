//
//  PokemonListTranslator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import DataStore
import Foundation

enum PokemonListTranslatorProvider {

    static func provide() -> PokemonListTranslator {
        return PokemonListTranslatorImpl()
    }
}

/// @mockable
protocol PokemonListTranslator {
    func convert(from response: PokemonListResponse) -> PokemonListModel
}

struct PokemonListTranslatorImpl: PokemonListTranslator {

    func convert(from response: PokemonListResponse) -> PokemonListModel {
        return PokemonListModel(response)
    }
}

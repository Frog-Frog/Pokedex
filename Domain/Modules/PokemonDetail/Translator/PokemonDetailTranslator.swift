//
//  PokemonDetailTranslator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

enum PokemonDetailTranslatorProvider {

    static func provide() -> PokemonDetailTranslator {
        return PokemonDetailTranslatorImpl()
    }
}

protocol PokemonDetailTranslator {
    func convert(from response: PokemonDetailResponse) -> PokemonDetailModel
}

private struct PokemonDetailTranslatorImpl: PokemonDetailTranslator {

    func convert(from response: PokemonDetailResponse) -> PokemonDetailModel {
        return PokemonDetailModel(response)
    }
}

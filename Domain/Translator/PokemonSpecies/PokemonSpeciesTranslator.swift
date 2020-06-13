//
//  PokemonSpeciesTranslator.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import DataStore
import Foundation

enum PokemonSpeciesTranslatorProvider {

    static func provide() -> PokemonSpeciesTranslator {
        return PokemonSpeciesTranslatorImpl()
    }
}

protocol PokemonSpeciesTranslator {
    func convert(from response: PokemonSpeciesResponse) -> PokemonSpeciesModel
}

private struct PokemonSpeciesTranslatorImpl: PokemonSpeciesTranslator {

    func convert(from response: PokemonSpeciesResponse) -> PokemonSpeciesModel {
        return PokemonSpeciesModel(response)
    }
}

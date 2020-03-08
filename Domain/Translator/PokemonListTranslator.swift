//
//  PokemonListTranslator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Foundation

enum PokemonListTranslatorProvider {
    
    static func provide() -> PokemonListTranslator {
        return PokemonListTranslatorImpl()
    }
}

protocol PokemonListTranslator {
    func convert(from response: PokemonListResponse) -> PokemonListViewData
}

private struct PokemonListTranslatorImpl: PokemonListTranslator {
    
    func convert(from response: PokemonListResponse) -> PokemonListViewData {
        return PokemonListViewData(response)
    }
}

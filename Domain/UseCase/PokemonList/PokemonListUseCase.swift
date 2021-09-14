//
//  PokemonListUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import DataStore
import Foundation

public enum PokemonListUseCaseProvider {

    public static func provide() -> PokemonListUseCase {
        return PokemonListUseCaseImpl(
            repository: PokemonListRepositoryProvider.provide(),
            translator: PokemonListTranslatorProvider.provide()
        )
    }
}

/// @mockable
public protocol PokemonListUseCase {
    func get(completion: @escaping ((Result<PokemonListModel, Error>) -> Void))
}

struct PokemonListUseCaseImpl: PokemonListUseCase {

    let repository: PokemonListRepository
    let translator: PokemonListTranslator

    func get(completion: @escaping ((Result<PokemonListModel, Error>) -> Void)) {
        self.repository.get { result in
            completion(result.map { self.translator.convert(from: $0) })
        }
    }
}

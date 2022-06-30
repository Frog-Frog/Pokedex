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
    func get() async throws -> PokemonListModel
}

struct PokemonListUseCaseImpl: PokemonListUseCase {

    let repository: PokemonListRepository
    let translator: PokemonListTranslator

    func get() async throws -> PokemonListModel {
        let response = try await self.repository.get()
        return self.translator.convert(from: response)
    }
}

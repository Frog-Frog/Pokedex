//
//  PokemonSpeciesUseCase.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import DataStore
import Foundation

public enum PokemonSpeciesUseCaseProvider {

    public static func provide() -> PokemonSpeciesUseCase {
        return PokemonSpeciesUseCaseImpl(repository: PokemonSpeciesRepositoryProvider.provide(), translator: PokemonSpeciesTranslatorProvider.provide())
    }
}

/// @mockable
public protocol PokemonSpeciesUseCase {
    func get(number: Int) async throws -> PokemonSpeciesModel
}

struct PokemonSpeciesUseCaseImpl: PokemonSpeciesUseCase {

    let repository: PokemonSpeciesRepository
    let translator: PokemonSpeciesTranslator

    func get(number: Int) async throws -> PokemonSpeciesModel {
        let response = try await self.repository.get(number: number)
        return self.translator.convert(from: response)
    }
}

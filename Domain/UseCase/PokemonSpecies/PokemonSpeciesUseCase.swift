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
    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesModel, Error>) -> Void))
}

struct PokemonSpeciesUseCaseImpl: PokemonSpeciesUseCase {

    let repository: PokemonSpeciesRepository
    let translator: PokemonSpeciesTranslator

    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesModel, Error>) -> Void)) {
        self.repository.get(number: number) { result in
            completion(result.map { self.translator.convert(from: $0) })
        }
    }
}

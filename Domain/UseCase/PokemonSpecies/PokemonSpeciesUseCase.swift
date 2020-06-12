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

public protocol PokemonSpeciesUseCase {
    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesModel, Error>) -> Void))
}

private struct PokemonSpeciesUseCaseImpl: PokemonSpeciesUseCase {

    let repository: PokemonSpeciesRepository
    let translator: PokemonSpeciesTranslator

    func get(number: Int, completion: @escaping ((Result<PokemonSpeciesModel, Error>) -> Void)) {
        self.repository.get(number: number) { result in
            switch result {
            case .success(let data):
                let model = self.translator.convert(from: data)
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

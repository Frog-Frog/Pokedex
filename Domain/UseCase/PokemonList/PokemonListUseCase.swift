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

    @available(iOS 15.0.0, *)
    func get() async throws -> PokemonListModel
}

struct PokemonListUseCaseImpl: PokemonListUseCase {

    let repository: PokemonListRepository
    let translator: PokemonListTranslator

    func get(completion: @escaping ((Result<PokemonListModel, Error>) -> Void)) {
        self.repository.get { result in
            switch result {
            case .success(let response):
                completion(.success(self.translator.convert(from: response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    @available(iOS 15.0.0, *)
    func get() async throws -> PokemonListModel {
        let response = try await self.repository.get()
        return self.translator.convert(from: response)
    }
}

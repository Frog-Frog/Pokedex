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

public protocol PokemonListUseCase {
    func get(completion: @escaping ((Result<PokemonListViewData, Error>) -> Void))
}

private struct PokemonListUseCaseImpl: PokemonListUseCase {
    
    let repository: PokemonListRepository
    let translator: PokemonListTranslator
    
    func get(completion: @escaping ((Result<PokemonListViewData, Error>) -> Void)) {
        self.repository.get(completion: { result in
            switch result {
            case .success(let response):
                completion(.success(self.translator.convert(from: response)))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

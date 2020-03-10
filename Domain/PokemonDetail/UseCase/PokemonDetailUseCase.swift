//
//  PokemonDetailUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import Foundation

public enum PokemonDetailUseCaseProvider {
    
    public static func provide() -> PokemonDetailUseCase {
        return PokemonDetailUseCaseImpl(
            repository: PokemonDetailRepositoryProvider.provide(),
            translator: PokemonDetailTranslatorProvider.provide()
        )
    }
}

public protocol PokemonDetailUseCase {
    func get(name: String, completion: @escaping ((Result<PokemonDetailViewData, Error>) -> Void))
}

private struct PokemonDetailUseCaseImpl: PokemonDetailUseCase {
    
    let repository: PokemonDetailRepository
    let translator: PokemonDetailTranslator
    
    func get(name: String, completion: @escaping ((Result<PokemonDetailViewData, Error>) -> Void)) {
        self.repository.get(name: name) { result in
            switch result {
            case .success(let response):
                completion(.success(self.translator.convert(from: response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

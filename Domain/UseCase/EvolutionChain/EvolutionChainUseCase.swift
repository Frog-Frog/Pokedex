//
//  EvolutionChainUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import DataStore
import Foundation

public enum EvolutionChainUseCaseProvider {

    public static func provide() -> EvolutionChainUseCase {
        return EvolutionChainUseCaseImpl(
            repository: EvolutionChainRepositoryProvider.provide(),
            translator: EvolutionChainTranslatorProvider.provide()
        )
    }
}

/// @mockable
public protocol EvolutionChainUseCase {
    func get(id: Int, completion: @escaping ((Result<EvolutionChainModel, Error>) -> Void))
}

struct EvolutionChainUseCaseImpl: EvolutionChainUseCase {

    let repository: EvolutionChainRepository
    let translator: EvolutionChainTranslator

    func get(id: Int, completion: @escaping ((Result<EvolutionChainModel, Error>) -> Void)) {
        self.repository.get(id: id) { result in
            completion(result.map { self.translator.convert(from: $0) })
        }
    }
}

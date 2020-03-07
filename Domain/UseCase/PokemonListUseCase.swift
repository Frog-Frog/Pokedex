//
//  PokemonListUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import DataStore
import Entity
import Foundation

public enum PokemonListUseCaseProvider {
    
    public static func provide() -> PokemonListUseCase {
        return PokemonListUseCaseImpl(repository: PokemonListRepositoryProvider.provide())
    }
}

public protocol PokemonListUseCase {
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void))
}

private struct PokemonListUseCaseImpl: PokemonListUseCase {
    
    let repository: PokemonListRepository
    
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void)) {
        self.repository.get(completion: completion)
    }
}

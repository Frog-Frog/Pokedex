//
//  PokemonListRepository.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

enum PokemonListRepositoryProvider {
    
    static func provide() -> PokemonListRepository {
        return PokemonListRepositoryImpl(apiGateway: PokemonListAPIGatewayProvider.provide())
    }
}

protocol PokemonListRepository {
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void))
}

private struct PokemonListRepositoryImpl: PokemonListRepository {
    
    let apiGateway: PokemonListAPIGateway
    
    func get(completion: @escaping ((Result<PokemonListResponse, Error>) -> Void)) {
        self.apiGateway.get(completion: completion)
    }
}

//
//  PokemonDetailRepository.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import Foundation

enum PokemonDetailRepositoryProvider {
    
    static func provide() -> PokemonDetailRepository {
        return PokemonDetailRepositoryImpl(apiGateway: PokemonDetailAPIGatewayProvider.provide())
    }
}

protocol PokemonDetailRepository {
    func get(name: String, completion: @escaping ((Result<PokemonDetailResponse, Error>) -> Void))
}

private struct PokemonDetailRepositoryImpl: PokemonDetailRepository {
    
    let apiGateway: PokemonDetailAPIGateway
    
    func get(name: String, completion: @escaping ((Result<PokemonDetailResponse, Error>) -> Void)) {
        self.apiGateway.get(name: name, completion: completion)
    }
}

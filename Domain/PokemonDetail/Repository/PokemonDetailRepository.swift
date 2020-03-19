//
//  PokemonDetailRepository.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

enum PokemonDetailRepositoryProvider {

    static func provide() -> PokemonDetailRepository {
        return PokemonDetailRepositoryImpl(
            pokemonDetailApiGateway: PokemonDetailAPIGatewayProvider.provide(),
            favoritePokemonRealmGateway: FavoritePokemonRealmGatewayProvider.provide()
        )
    }
}

protocol PokemonDetailRepository {
    func get(name: String, completion: @escaping ((Result<(response: PokemonDetailResponse, isFavorite: Bool), Error>) -> Void))
}

private struct PokemonDetailRepositoryImpl: PokemonDetailRepository {

    let pokemonDetailApiGateway: PokemonDetailAPIGateway
    let favoritePokemonRealmGateway: FavoritePokemonRealmGateway

    func get(name: String, completion: @escaping ((Result<(response: PokemonDetailResponse, isFavorite: Bool), Error>) -> Void)) {
        self.pokemonDetailApiGateway.get(name: name) { result in
            switch result {
            case .success(let response):
                let isFavorite = self.favoritePokemonRealmGateway.contains(response.id)
                completion(.success((response: response, isFavorite: isFavorite)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

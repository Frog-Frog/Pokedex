//
//  PokemonDetailUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

public enum PokemonDetailUseCaseProvider {

    public static func provide() -> PokemonDetailUseCase {
        return PokemonDetailUseCaseImpl(
            pokemonDetailRepository: PokemonDetailRepositoryProvider.provide(),
            favoritePokemonRepository: FavoritePokemonRepositoryProvider.provide(),
            translator: PokemonDetailTranslatorProvider.provide()
        )
    }
}

public protocol PokemonDetailUseCase {
    func get(name: String, completion: @escaping ((Result<PokemonDetailData, Error>) -> Void))
}

private struct PokemonDetailUseCaseImpl: PokemonDetailUseCase {

    let pokemonDetailRepository: PokemonDetailRepository
    let favoritePokemonRepository: FavoritePokemonRepository
    let translator: PokemonDetailTranslator

    func get(name: String, completion: @escaping ((Result<PokemonDetailData, Error>) -> Void)) {
        self.pokemonDetailRepository.get(name: name) { result in
            switch result {
            case .success(let response):
                let isFavorite = self.favoritePokemonRepository.contains(response.id)
                let data = self.translator.convert(from: response, isFavorite: isFavorite)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

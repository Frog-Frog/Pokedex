//
//  PokemonDetailRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import Foundation

public enum PokemonDetailRepositoryProvider {

    public static func provide() -> PokemonDetailRepository {
        return PokemonDetailRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide(),
                                           imagaDataStore: ImageDataStoreProvider.provide(),
                                           spotlightDataStore: SpotlightDataStoreProvider.provide())
    }
}

/// @mockable
public protocol PokemonDetailRepository {
    func get(number: Int, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void)
    func saveSpotlight(number: Int, name: String, imageUrl: URL?)
}

struct PokemonDetailRepositoryImpl: PokemonDetailRepository {

    let apiDataStore: PokeAPIDataStore
    let imagaDataStore: ImageDataStore
    let spotlightDataStore: SpotlightDataStore

    func get(number: Int, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        self.apiDataStore.request(PokemonDetailAPIRequest(number: number), completion: completion)
    }

    func saveSpotlight(number: Int, name: String, imageUrl: URL?) {
        guard let url = imageUrl else {
            return
        }
        self.imagaDataStore.load(from: url) { result in
            switch result {
            case .success(let data):
                self.spotlightDataStore.save(PokemonDetailSpotlightRequest(number: number, name: name, imageData: data))
            case .failure:
                // 失敗してもSpotlightに出ないだけなので無視する
                break
            }
        }
    }
}

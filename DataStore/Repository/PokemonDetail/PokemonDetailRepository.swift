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

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> PokemonDetailResponse

    func saveSpotlight(number: Int, name: String, imageUrl: URL?)
}

struct PokemonDetailRepositoryImpl: PokemonDetailRepository {

    let apiDataStore: PokeAPIDataStore
    let imagaDataStore: ImageDataStore
    let spotlightDataStore: SpotlightDataStore

    func get(number: Int, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        self.apiDataStore.request(PokemonDetailAPIRequest(number: number), completion: completion)
    }

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> PokemonDetailResponse {
        try await self.apiDataStore.request(PokemonDetailAPIRequest(number: number))
    }

    func saveSpotlight(number: Int, name: String, imageUrl: URL?) {
        guard let url = imageUrl else {
            return
        }
        if #available(iOS 15.0.0, *) {
            Task {
                let data = try await self.imagaDataStore.load(from: url)
                self.spotlightDataStore.save(PokemonDetailSpotlightRequest(number: number, name: name, imageData: data))
            }
        } else {
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
}

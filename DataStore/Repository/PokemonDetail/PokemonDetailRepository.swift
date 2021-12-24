//
//  PokemonDetailRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import Foundation

public enum PokemonDetailRepositoryProvider {

    public static func provide() -> PokemonDetailRepository {
        return PokemonDetailRepositoryImpl(apiDataStore: APIDataStoreProvider.provide(),
                                           imagaDataStore: ImageDataStoreProvider.provide(),
                                           spotlightDataStore: SpotlightDataStoreProvider.provide())
    }
}

/// @mockable
public protocol PokemonDetailRepository {
    func get(number: Int) async throws -> PokemonDetailResponse

    func saveSpotlight(number: Int, name: String, imageUrl: URL?)
}

struct PokemonDetailRepositoryImpl: PokemonDetailRepository {

    let apiDataStore: APIDataStore
    let imagaDataStore: ImageDataStore
    let spotlightDataStore: SpotlightDataStore

    func get(number: Int) async throws -> PokemonDetailResponse {
        try await self.apiDataStore.request(PokemonDetailAPIRequest(number: number))
    }

    func saveSpotlight(number: Int, name: String, imageUrl: URL?) {
        guard let url = imageUrl else {
            return
        }
        Task {
            let data = try await self.imagaDataStore.load(from: url)
            self.spotlightDataStore.save(PokemonDetailSpotlightRequest(number: number, name: name, imageData: data))
        }
    }
}

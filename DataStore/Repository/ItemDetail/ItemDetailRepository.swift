//
//  ItemDetailRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public enum ItemDetailRepositoryProvider {

    public static func provide() -> ItemDetailRepository {
        return ItemDetailRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide(),
                                        imagaDataStore: ImageDataStoreProvider.provide(),
                                        spotlightDataStore: SpotlightDataStoreProvider.provide())
    }
}

/// @mockable
public protocol ItemDetailRepository {
    func get(number: Int, completion: @escaping (Result<ItemDetailResponse, Error>) -> Void)

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> ItemDetailResponse

    func saveSpotlight(number: Int, name: String, imageUrl: URL?)
}

struct ItemDetailRepositoryImpl: ItemDetailRepository {

    let apiDataStore: PokeAPIDataStore
    let imagaDataStore: ImageDataStore
    let spotlightDataStore: SpotlightDataStore

    func get(number: Int, completion: @escaping (Result<ItemDetailResponse, Error>) -> Void) {
        self.apiDataStore.request(ItemDetailAPIRequest(number: number), completion: completion)
    }

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> ItemDetailResponse {
        try await self.apiDataStore.request(ItemDetailAPIRequest(number: number))
    }

    func saveSpotlight(number: Int, name: String, imageUrl: URL?) {
        guard let url = imageUrl else {
            return
        }
        if #available(iOS 15.0.0, *) {
            Task {
                let data = try await self.imagaDataStore.load(from: url)
                self.spotlightDataStore.save(ItemDetailSpotlightRequest(number: number, name: name, imageData: data))
            }
        } else {
            self.imagaDataStore.load(from: url) { result in
                switch result {
                case .success(let data):
                    self.spotlightDataStore.save(ItemDetailSpotlightRequest(number: number, name: name, imageData: data))
                case .failure:
                    // 失敗してもSpotlightに出ないだけなので無視する
                    break
                }
            }
        }
    }
}

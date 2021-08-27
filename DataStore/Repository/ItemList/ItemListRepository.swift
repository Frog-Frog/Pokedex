//
//  ItemListRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public enum ItemListRepositoryProvider {

    public static func provide() -> ItemListRepository {
        return ItemListRepositoryImpl(apiDataStore: PokeAPIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol ItemListRepository {
    func get(completion: @escaping ((Result<ItemListResponse, Error>) -> Void))

    @available(iOS 15.0.0, *)
    func get() async throws -> ItemListResponse
}

struct ItemListRepositoryImpl: ItemListRepository {

    let apiDataStore: PokeAPIDataStore

    func get(completion: @escaping ((Result<ItemListResponse, Error>) -> Void)) {
        self.apiDataStore.request(ItemListAPIRequest(), completion: completion)
    }

    @available(iOS 15.0.0, *)
    func get() async throws -> ItemListResponse {
        try await self.apiDataStore.request(ItemListAPIRequest())
    }
}

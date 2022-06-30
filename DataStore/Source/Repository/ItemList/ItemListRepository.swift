//
//  ItemListRepository.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public enum ItemListRepositoryProvider {

    public static func provide() -> ItemListRepository {
        return ItemListRepositoryImpl(apiDataStore: APIDataStoreProvider.provide())
    }
}

/// @mockable
public protocol ItemListRepository {
    func get() async throws -> ItemListResponse
}

struct ItemListRepositoryImpl: ItemListRepository {

    let apiDataStore: APIDataStore

    func get() async throws -> ItemListResponse {
        try await self.apiDataStore.request(ItemListAPIRequest())
    }
}

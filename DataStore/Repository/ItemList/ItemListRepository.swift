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

public protocol ItemListRepository {
    func get(completion: @escaping ((Result<ItemListResponse, Error>) -> Void))
}

private struct ItemListRepositoryImpl: ItemListRepository {

    let apiDataStore: PokeAPIDataStore

    func get(completion: @escaping ((Result<ItemListResponse, Error>) -> Void)) {
        self.apiDataStore.request(ItemListAPIRequest(), completion: completion)
    }
}

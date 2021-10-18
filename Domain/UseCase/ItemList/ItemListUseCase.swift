//
//  ItemListUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

public enum ItemListUseCaseProvider {

    public static func provide() -> ItemListUseCase {
        return ItemListUseCaseImpl(
            repository: ItemListRepositoryProvider.provide(),
            translator: ItemListTranslatorProvider.provide()
        )
    }
}

/// @mockable
public protocol ItemListUseCase {
    func get() async throws -> ItemListModel
}

struct ItemListUseCaseImpl: ItemListUseCase {

    let repository: ItemListRepository
    let translator: ItemListTranslator

    func get() async throws -> ItemListModel {
        let response = try await self.repository.get()
        return self.translator.convert(from: response)
    }
}

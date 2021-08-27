//
//  ItemDetailUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

public enum ItemDetailUseCaseProvider {

    public static func provide() -> ItemDetailUseCase {
        return ItemDetailUseCaseImpl(
            repository: ItemDetailRepositoryProvider.provide(),
            translator: ItemDetailTranslatorProvider.provide()
        )
    }
}

/// @mockable
public protocol ItemDetailUseCase {
    func get(number: Int, completion: @escaping ((Result<ItemDetailModel, Error>) -> Void))

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> ItemDetailModel
}

struct ItemDetailUseCaseImpl: ItemDetailUseCase {

    let repository: ItemDetailRepository
    let translator: ItemDetailTranslator

    func get(number: Int, completion: @escaping ((Result<ItemDetailModel, Error>) -> Void)) {
        self.repository.get(number: number) { result in
            switch result {
            case .success(let response):
                let model = self.translator.convert(from: response)
                self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    @available(iOS 15.0.0, *)
    func get(number: Int) async throws -> ItemDetailModel {
        let response = try await self.repository.get(number: number)
        let model = self.translator.convert(from: response)
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)
        return model
    }
}

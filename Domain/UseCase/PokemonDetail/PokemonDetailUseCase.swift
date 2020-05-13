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
            repository: PokemonDetailRepositoryProvider.provide(),
            translator: PokemonDetailTranslatorProvider.provide()
        )
    }
}

public protocol PokemonDetailUseCase {
    func get(number: Int, completion: @escaping ((Result<PokemonDetailModel, Error>) -> Void))
}

private struct PokemonDetailUseCaseImpl: PokemonDetailUseCase {

    let repository: PokemonDetailRepository
    let translator: PokemonDetailTranslator

    func get(number: Int, completion: @escaping ((Result<PokemonDetailModel, Error>) -> Void)) {
        self.repository.get(number: number) { result in
            switch result {
            case .success(let data):
                let model = self.translator.convert(from: data)
                self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

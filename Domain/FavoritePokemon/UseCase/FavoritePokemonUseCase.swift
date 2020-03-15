//
//  FavoritePokemonUseCase.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import Foundation

public enum FavoritePokemonUseCaseProvider {

    public static func provide() -> FavoritePokemonUseCase {
        return FavoritePokemonUseCaseImpl(
            translator: FavoritePokemonTranslatorProvider.provide(),
            repository: FavoritePokemonRepositoryProvider.provide()
        )
    }
}

public protocol FavoritePokemonUseCase {

    typealias Pokemon = (number: Int, name: String)

    func get() -> FavoritePokemonData
    func isFavorite(_ id: Int) -> Bool
    func add(_ pokemon: Pokemon)
    func remove(_ pokemon: Pokemon)
}

private struct FavoritePokemonUseCaseImpl: FavoritePokemonUseCase {

    let translator: FavoritePokemonTranslator
    let repository: FavoritePokemonRepository

    func get() -> FavoritePokemonData {
        let pokemons = self.repository.get()
        return self.translator.convert(from: pokemons)
    }

    func isFavorite(_ id: Int) -> Bool {
        return self.repository.contains(id)
    }

    func add(_ pokemon: Pokemon) {
        self.repository.add(pokemon)
    }

    func remove(_ pokemon: Pokemon) {
        self.repository.delete(pokemon)
    }
}

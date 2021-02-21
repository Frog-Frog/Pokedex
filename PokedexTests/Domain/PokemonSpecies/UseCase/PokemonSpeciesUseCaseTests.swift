//
//  PokemonSpeciesUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonSpeciesUseCaseTests: XCTestCase {

    private var useCase: PokemonSpeciesUseCase!

    private var pokemonSpeciesRepositoryMock: PokemonSpeciesRepositoryMock!
    private var pokemonSpeciesTranslatorMock: PokemonSpeciesTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.pokemonSpeciesRepositoryMock = PokemonSpeciesRepositoryMock()
        self.pokemonSpeciesTranslatorMock = PokemonSpeciesTranslatorMock()
        self.useCase = PokemonSpeciesUseCaseImpl(repository: self.pokemonSpeciesRepositoryMock, translator: self.pokemonSpeciesTranslatorMock)
    }
}

// MARK: - PokemonSpeciesRepository Callback Tests
extension PokemonSpeciesUseCaseTests {

    func test_get_success() {
        self.pokemonSpeciesRepositoryMock.getHandler = { _, result in
            result(.success(PokemonSpeciesResponse.stub))
        }
        self.pokemonSpeciesTranslatorMock.convertHandler = { response in
            return PokemonSpeciesModel(response)
        }

        self.useCase.get(number: 1) { _ in }

        XCTAssertEqual(self.pokemonSpeciesRepositoryMock.getCallCount, 1)
        XCTAssertEqual(self.pokemonSpeciesTranslatorMock.convertCallCount, 1)
    }

    func test_get_failure() {
        self.pokemonSpeciesRepositoryMock.getHandler = { _, result in
            result(.failure(TestError.stub))
        }

        self.useCase.get(number: 1) { _ in }

        XCTAssertEqual(self.pokemonSpeciesRepositoryMock.getCallCount, 1)
        XCTAssertEqual(self.pokemonSpeciesTranslatorMock.convertCallCount, 0)
    }
}

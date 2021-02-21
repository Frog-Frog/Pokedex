//
//  PokemonListUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonListUseCaseTests: XCTestCase {

    private var useCase: PokemonListUseCase!

    private var pokemonListRepositoryMock: PokemonListRepositoryMock!
    private var pokemonListTranslatorMock: PokemonListTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.pokemonListRepositoryMock = PokemonListRepositoryMock()
        self.pokemonListTranslatorMock = PokemonListTranslatorMock()
        self.useCase = PokemonListUseCaseImpl(repository: self.pokemonListRepositoryMock, translator: self.pokemonListTranslatorMock)
    }
}

// MARK: - PokemonListRepository Callback Tests
extension PokemonListUseCaseTests {

    func test_get_success() {
        self.pokemonListRepositoryMock.getHandler = { result in
            result(.success(PokemonListResponse.stub))
        }
        self.pokemonListTranslatorMock.convertHandler = { response in
            return PokemonListModel(response)
        }

        self.useCase.get { _ in }

        XCTAssertEqual(self.pokemonListRepositoryMock.getCallCount, 1)
        XCTAssertEqual(self.pokemonListTranslatorMock.convertCallCount, 1)
    }

    func test_get_failure() {
        self.pokemonListRepositoryMock.getHandler = { result in
            result(.failure(TestError.stub))
        }

        self.useCase.get { _ in }

        XCTAssertEqual(self.pokemonListRepositoryMock.getCallCount, 1)
        XCTAssertEqual(self.pokemonListTranslatorMock.convertCallCount, 0)
    }
}

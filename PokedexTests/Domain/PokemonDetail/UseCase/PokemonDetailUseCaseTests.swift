//
//  PokemonDetailUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonDetailUseCaseTests: XCTestCase {

    private var useCase: PokemonDetailUseCase!

    private var pokemonDetailRepositoryMock: PokemonDetailRepositoryMock!
    private var pokemonDetailTranslatorMock: PokemonDetailTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.pokemonDetailRepositoryMock = PokemonDetailRepositoryMock()
        self.pokemonDetailTranslatorMock = PokemonDetailTranslatorMock()
        self.useCase = PokemonDetailUseCaseImpl(repository: self.pokemonDetailRepositoryMock, translator: self.pokemonDetailTranslatorMock)
    }
}

// MARK: - PokemonDetailRepository Callback Tests
extension PokemonDetailUseCaseTests {

    func test_get_success() {
        self.pokemonDetailRepositoryMock.getHandler = { _ in
            return PokemonDetailResponse.bulbasaurStub
        }
        self.pokemonDetailTranslatorMock.convertHandler = { response in
            return PokemonDetailModel(response)
        }

        Task {
            _ = try await self.useCase.get(number: 1)

            XCTAssertEqual(self.pokemonDetailRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.pokemonDetailRepositoryMock.saveSpotlightCallCount, 1)
            XCTAssertEqual(self.pokemonDetailTranslatorMock.convertCallCount, 1)
        }
    }

    func test_get_failure() {
        self.pokemonDetailRepositoryMock.getHandler = { _ in
            throw TestError.stub
        }

        Task {
            _ = try await self.useCase.get(number: 1)

            XCTAssertEqual(self.pokemonDetailRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.pokemonDetailRepositoryMock.saveSpotlightCallCount, 0)
            XCTAssertEqual(self.pokemonDetailTranslatorMock.convertCallCount, 0)
        }
    }
}

//
//  EvolutionChainUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class EvolutionChainUseCaseTests: XCTestCase {

    private var useCase: EvolutionChainUseCase!

    private var evolutionChainRepositoryMock: EvolutionChainRepositoryMock!
    private var evolutionChainTranslatorMock: EvolutionChainTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.evolutionChainRepositoryMock = EvolutionChainRepositoryMock()
        self.evolutionChainTranslatorMock = EvolutionChainTranslatorMock()
        self.useCase = EvolutionChainUseCaseImpl(repository: self.evolutionChainRepositoryMock, translator: self.evolutionChainTranslatorMock)
    }
}

// MARK: - EvolutionChainRepository Callback Tests
extension EvolutionChainUseCaseTests {

    func test_get_success() {
        self.evolutionChainRepositoryMock.getHandler = { _ in
            return EvolutionChainResponse.bulbasaurStub
        }
        self.evolutionChainTranslatorMock.convertHandler = { response in
            return EvolutionChainModel(response)
        }

        Task {
            _ = try await self.useCase.get(id: 1)

            XCTAssertEqual(self.evolutionChainRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.evolutionChainTranslatorMock.convertCallCount, 1)
        }
    }

    func test_get_failure() {
        self.evolutionChainRepositoryMock.getHandler = { _ in
            throw TestError.stub
        }

        Task {
            _ = try await self.useCase.get(id: 1)

            XCTAssertEqual(self.evolutionChainRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.evolutionChainTranslatorMock.convertCallCount, 0)
        }
    }
}

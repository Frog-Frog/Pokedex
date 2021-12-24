//
//  PokemonDetailPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import Domain
@testable import Presentation

final class PokemonDetailPresenterTests: XCTestCase {

    private var presenter: PokemonDetailPresenter!

    private var viewMock: PokemonDetailViewMock!
    private var wireframeMock: PokemonDetailWireframeMock!
    private var pokemonDetailUseCaseMock: PokemonDetailUseCaseMock!
    private var pokemonSpeciesUseCaseMock: PokemonSpeciesUseCaseMock!
    private var evolutionChainUseCaseMock: EvolutionChainUseCaseMock!

    private var detailExpectation: XCTestExpectation!
    private var evolutionExpectation: XCTestExpectation!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = PokemonDetailViewMock()
        self.viewMock.showPokemonDetailModelHandler = { _ in
            self.detailExpectation?.fulfill()
        }
        self.viewMock.showEvolutionChainHandler = { _ in
            self.evolutionExpectation?.fulfill()
        }
        self.viewMock.showErrorAlertHandler = { _ in
            self.detailExpectation?.fulfill()
            self.evolutionExpectation?.fulfill()
        }

        self.wireframeMock = PokemonDetailWireframeMock()

        self.pokemonDetailUseCaseMock = PokemonDetailUseCaseMock()
        self.pokemonDetailUseCaseMock.getHandler = { _ in
            return PokemonDetailModel.stub
        }

        self.pokemonSpeciesUseCaseMock = PokemonSpeciesUseCaseMock()
        self.pokemonSpeciesUseCaseMock.getHandler = { _ in
            return PokemonSpeciesModel.stub
        }

        self.evolutionChainUseCaseMock = EvolutionChainUseCaseMock()
        self.evolutionChainUseCaseMock.getHandler = { _ in
            return EvolutionChainModel.stub
        }

        let presenter = PokemonDetailPresenterImpl(number: 1)
        presenter.view = self.viewMock
        presenter.wireframe = self.wireframeMock
        presenter.pokemonDetailUseCase = self.pokemonDetailUseCaseMock
        presenter.pokemonSpeciesUseCase = self.pokemonSpeciesUseCaseMock
        presenter.evolutionChainUseCase = self.evolutionChainUseCaseMock

        self.presenter = presenter
    }
}

// MARK: - Interface Call Tests
extension PokemonDetailPresenterTests {

    func test_viewDidLoad() {
        self.detailExpectation = self.expectation(description: "Detail")
        self.evolutionExpectation = self.expectation(description: "Evolution")

        self.presenter.viewDidLoad()

        self.wait(for: [self.detailExpectation, self.evolutionExpectation], timeout: 10.0)
        XCTAssertEqual(self.pokemonDetailUseCaseMock.getCallCount, 1)
        XCTAssertEqual(self.pokemonSpeciesUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPop() {
        self.presenter.didSelectPop()

        XCTAssertEqual(self.wireframeMock.popCallCount, 1)
    }

    func test_didSelectEvolutionChain_nilModel() {
        self.presenter.didSelectEvolutionChain()

        XCTAssertEqual(self.wireframeMock.presentEvolutionChainCallCount, 0)
    }

    func test_didSelectEvolutionChain_existModel() {
        self.evolutionExpectation = self.expectation(description: "Evolution")

        self.presenter.viewDidLoad()

        self.wait(for: [self.evolutionExpectation], timeout: 10.0)
        self.presenter.didSelectEvolutionChain()

        XCTAssertEqual(self.wireframeMock.presentEvolutionChainCallCount, 1)
    }
}

// MARK: - PokemonDetailUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestPokemonDetailModel_success() {
        self.detailExpectation = self.expectation(description: "Detail")

        self.presenter.viewDidLoad()

        self.wait(for: [self.detailExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showPokemonDetailModelCallCount, 1)
    }

    func test_requestPokemonDetailModel_failure() {
        self.detailExpectation = self.expectation(description: "Detail")
        self.pokemonDetailUseCaseMock.getHandler = { _ in
            throw TestError.stub
        }

        self.presenter.viewDidLoad()

        self.wait(for: [self.detailExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

// MARK: - PokemonSpeciesUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestPokemonSpeciesModel_success() {
        self.evolutionExpectation = self.expectation(description: "Evolution")

        self.presenter.viewDidLoad()

        self.wait(for: [self.evolutionExpectation], timeout: 10.0)
        XCTAssertEqual(self.evolutionChainUseCaseMock.getCallCount, 1)
    }

    func test_requestPokemonSpeciesModel_failure() {
        self.evolutionExpectation = self.expectation(description: "Evolution")
        self.pokemonSpeciesUseCaseMock.getHandler = { _ in
            throw TestError.stub
        }

        self.presenter.viewDidLoad()

        self.wait(for: [self.evolutionExpectation], timeout: 10.0)
        XCTAssertEqual(self.evolutionChainUseCaseMock.getCallCount, 0)
        XCTAssertEqual(self.viewMock.showEvolutionChainCallCount, 1)
    }
}

// MARK: - EvolutionChainUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestEvolutionChainModel_success() {
        self.evolutionExpectation = self.expectation(description: "Evolution")

        self.presenter.viewDidLoad()

        self.wait(for: [self.evolutionExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showEvolutionChainCallCount, 1)
    }

    func test_requestEvolutionChainModel_failure() {
        self.evolutionExpectation = self.expectation(description: "Evolution")
        self.evolutionChainUseCaseMock.getHandler = { _ in
            throw TestError.stub
        }

        self.presenter.viewDidLoad()

        self.wait(for: [self.evolutionExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showEvolutionChainCallCount, 1)
    }
}

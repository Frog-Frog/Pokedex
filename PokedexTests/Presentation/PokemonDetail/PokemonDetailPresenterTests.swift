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

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = PokemonDetailViewMock()
        self.wireframeMock = PokemonDetailWireframeMock()
        self.pokemonDetailUseCaseMock = PokemonDetailUseCaseMock()
        self.pokemonSpeciesUseCaseMock = PokemonSpeciesUseCaseMock()
        self.evolutionChainUseCaseMock = EvolutionChainUseCaseMock()

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
        self.presenter.viewDidLoad()

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
        self.pokemonSpeciesUseCaseMock.getHandler = { _, result in
            return result(.success(PokemonSpeciesModel.stub))
        }

        self.evolutionChainUseCaseMock.getHandler = { _, result in
            return result(.success(EvolutionChainModel.stub))
        }

        self.test_viewDidLoad()
        self.presenter.didSelectEvolutionChain()

        XCTAssertEqual(self.wireframeMock.presentEvolutionChainCallCount, 1)
    }
}

// MARK: - PokemonDetailUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestPokemonDetailModel_success() {
        self.pokemonDetailUseCaseMock.getHandler = { _, result in
            result(.success(PokemonDetailModel.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showPokemonDetailModelCallCount, 1)
    }

    func test_requestPokemonDetailModel_failure() {
        self.pokemonDetailUseCaseMock.getHandler = { _, result in
            result(.failure(TestError.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

// MARK: - PokemonSpeciesUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestPokemonSpeciesModel_success() {
        self.pokemonSpeciesUseCaseMock.getHandler = { _, result in
            result(.success(PokemonSpeciesModel.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.evolutionChainUseCaseMock.getCallCount, 1)
    }

    func test_requestPokemonSpeciesModel_failure() {
        self.pokemonSpeciesUseCaseMock.getHandler = { _, result in
            result(.failure(TestError.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

// MARK: - EvolutionChainUseCase Callback Tests
extension PokemonDetailPresenterTests {

    func test_requestEvolutionChainModel_success() {
        self.pokemonSpeciesUseCaseMock.getHandler = { _, result in
            result(.success(PokemonSpeciesModel.stub))
        }

        self.evolutionChainUseCaseMock.getHandler = { _, result in
            result(.success(EvolutionChainModel.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showEvolutionChainCallCount, 1)
    }

    func test_requestEvolutionChainModel_failure() {
        self.pokemonSpeciesUseCaseMock.getHandler = { _, result in
            result(.success(PokemonSpeciesModel.stub))
        }

        self.evolutionChainUseCaseMock.getHandler = { _, result in
            result(.failure(TestError.stub))
        }

        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

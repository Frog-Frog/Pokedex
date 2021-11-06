//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

import XCTest
import Domain
@testable import Presentation

final class PokemonListPresenterTests: XCTestCase {

    private var presenter: PokemonListPresenter!

    private var viewMock: PokemonListViewMock!
    private var pokemonListUseCaseMock: PokemonListUseCaseMock!
    private var wireframeMock: PokemonListWireframeMock!

    private var asyncExpectation: XCTestExpectation!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = PokemonListViewMock()
        self.viewMock.showPokemonListModelHandler = { _ in
            self.asyncExpectation.fulfill()
        }
        self.viewMock.showErrorAlertHandler = { _ in
            self.asyncExpectation.fulfill()
        }

        self.pokemonListUseCaseMock =  PokemonListUseCaseMock()
        self.pokemonListUseCaseMock.getHandler = {
            return PokemonListModel.stub
        }

        self.wireframeMock = PokemonListWireframeMock()

        let presenter = PokemonListPresenterImpl()
        presenter.view = self.viewMock
        presenter.pokemonListUseCase = self.pokemonListUseCaseMock
        presenter.wireframe = self.wireframeMock
        self.presenter = presenter
    }
}

// MARK: - Interface Call Tests
extension PokemonListPresenterTests {

    func test_viewDidLoad() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.pokemonListUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPokemon() {
        let pokemon = Pokemon.stub

        self.wireframeMock.pushPokemonDetailHandler = {
            XCTAssertEqual($0, pokemon.number)
        }

        self.presenter.didSelect(pokemon)
        XCTAssertEqual(self.wireframeMock.pushPokemonDetailCallCount, 1)
    }
}

// MARK: - PokemonListUseCase Callback Tests
extension PokemonListPresenterTests {

    func test_requestPokemonListModel_success() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showPokemonListModelCallCount, 1)
    }

    func test_requestPokemonListModel_failure() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.pokemonListUseCaseMock.getHandler = {
            throw TestError.stub
        }
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

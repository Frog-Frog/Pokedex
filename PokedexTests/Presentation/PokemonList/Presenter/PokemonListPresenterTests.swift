//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/19.
//

import XCTest
@testable import DataStore
@testable import Domain
@testable import Presentation

final class PokemonListPreseterTests: XCTestCase {

    // MARK: Stored Instance Properties
    private var viewMock: PokemonListViewMock!
    private var pokemonListUseCaseMock: PokemonListUseCaseMock!
    private var wireframeMock: PokemonListWireframeMock!
    private var presenter: PokemonListPresenter!

    // MARK: TestCase Life-Cycle Methods

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = PokemonListViewMock()
        self.pokemonListUseCaseMock =  PokemonListUseCaseMock()
        self.wireframeMock = PokemonListWireframeMock()
        let presenter = PokemonListPresenterImpl()
        presenter.view = self.viewMock
        presenter.pokemonListUseCase = self.pokemonListUseCaseMock
        presenter.wireframe = self.wireframeMock
        self.presenter = presenter
    }

    // MARK: - Presenter Interface Tests
    func test_viewDidLoad() {
        self.presenter.viewDidLoad()
        XCTAssertEqual(self.pokemonListUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPokemon() {
        let pokemon = Pokemon.stub
        self.presenter.didSelect(pokemon)
        XCTAssertEqual(self.wireframeMock.pushPokemonDetailCallCount, 1)
    }

    // MARK: - RequestPokemonListModel Tests
    func test_requestPokemonListModel() {
        let testCase: [Result<PokemonListModel, Error>] = [
            .success(PokemonListModel.stub),
            .failure(TestError.stub)
        ]

        testCase.forEach { result in
            self.pokemonListUseCaseMock.getHandler = {
                return $0(result)
            }
            self.presenter.viewDidLoad()
        }

        // Success
        XCTAssertEqual(self.viewMock.showPokemonListModelCallCount, 1)
        // Failure
        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

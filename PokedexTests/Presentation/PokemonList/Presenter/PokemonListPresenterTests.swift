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
}

// MARK: - Interface Call Tests
extension PokemonListPresenterTests {

    func test_viewDidLoad() {
        self.presenter.viewDidLoad()
        XCTAssertEqual(self.pokemonListUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPokemon() {
        let pokemon = Pokemon.stub
        self.presenter.didSelect(pokemon)
        XCTAssertEqual(self.wireframeMock.pushPokemonDetailCallCount, 1)
    }
}

// MARK: - PokemonListUseCase Callback Tests
extension PokemonListPresenterTests {

    func test_requestPokemonListModel_success() {
        self.pokemonListUseCaseMock.getHandler = {
            return $0(.success(PokemonListModel.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showPokemonListModelCallCount, 1)
    }

    func test_requestPokemonListModel_failure() {
        self.pokemonListUseCaseMock.getHandler = {
            return $0(.failure(TestError.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

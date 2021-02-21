//
//  EvolutionChainPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import Domain
@testable import Presentation

final class EvolutionChainPresenterTests: XCTestCase {

    private var presenter: EvolutionChainPresenter!

    private var viewMock: EvolutionChainViewMock!
    private var wireframeMock: EvolutionChainWireframeMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = EvolutionChainViewMock()
        self.wireframeMock = EvolutionChainWireframeMock()

        let presenter = EvolutionChainPresenterImpl(evolutionChainModel: EvolutionChainModel.stub)
        presenter.view = self.viewMock
        presenter.wireframe = self.wireframeMock
        self.presenter = presenter
    }
}

// MARK: - Interface Call Tests
extension EvolutionChainPresenterTests {

    func test_viewDidLoad() {
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showEvolutionChainModelCallCount, 1)
    }

    func test_didSelectClose() {
        self.presenter.didSelectClose()

        XCTAssertEqual(self.wireframeMock.dismissAnimatedCallCount, 1)
    }

    func test_didSelectPokemon() {
        let pokemon = Pokemon.stub

        self.wireframeMock.dismissWithPushPokemonDetailHandler = {
            XCTAssertEqual($0, pokemon.number)
        }

        self.presenter.didSelect(pokemon)

        XCTAssertEqual(self.wireframeMock.dismissWithPushPokemonDetailCallCount, 1)
    }
}

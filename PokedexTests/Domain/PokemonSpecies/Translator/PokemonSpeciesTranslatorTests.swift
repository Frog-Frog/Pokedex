//
//  PokemonSpeciesTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonSpeciesTranslatorTests: XCTestCase {

    private var translator: PokemonSpeciesTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = PokemonSpeciesTranslatorImpl()
    }
}

// MARK: - Translate Data Tests
extension PokemonSpeciesTranslatorTests {

    func test_translate() {
        let response = PokemonSpeciesResponse.stub

        let model = self.translator.convert(from: response)

        XCTAssertTrue(response.evolutionChain.url.contains("\(model.evolutionChainId)"))
    }
}

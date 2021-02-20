//
//  PokemonListTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
@testable import DataStore
@testable import Domain

final class PokemonListTranslatorTests: XCTestCase {

    private var translator: PokemonListTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = PokemonListTranslatorImpl()
    }
}

// MARK: - Translate Data Tests
extension PokemonListTranslatorTests {

    func test_translate() {
        let response = PokemonListResponse.stub

        let model = self.translator.convert(from: response)

        model.pokemons.enumerated().forEach {
            XCTAssertEqual($0.element.name.caseInsensitiveCompare(response.results[$0.offset].name), .orderedSame)
            XCTAssertTrue(response.results[$0.offset].url.contains("\($0.element.number)"))
        }
    }
}

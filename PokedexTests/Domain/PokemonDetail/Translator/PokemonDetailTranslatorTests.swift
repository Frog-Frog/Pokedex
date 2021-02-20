//
//  PokemonDetailTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonDetailTranslatorTests: XCTestCase {

    private var translator: PokemonDetailTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = PokemonDetailTranslatorImpl()
    }
}

// MARK: - Translate Data Tests
extension PokemonDetailTranslatorTests {

    func test_translate() {
        let response = PokemonDetailResponse.stub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.name.caseInsensitiveCompare(response.name), .orderedSame)
        XCTAssertEqual(model.number, response.id)
        // TODO: Add Other Assertion
    }
}

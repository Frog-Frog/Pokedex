//
//  ItemDetailTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import DataStore
@testable import Domain

final class ItemDetailTranslatorTests: XCTestCase {

    private var translator: ItemDetailTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = ItemDetailTranslatorImpl()
    }
}

// MARK: - Translate Data Tests
extension ItemDetailTranslatorTests {

    func test_translate() {
        let response = ItemDetailResponse.stub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.name.caseInsensitiveCompare(response.name), .orderedSame)
        XCTAssertEqual(model.number, response.id)
        XCTAssertEqual(model.imageUrl.absoluteString, response.sprites.default)
    }
}

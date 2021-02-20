//
//  ItemListTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import DataStore
@testable import Domain

final class ItemListTranslatorTests: XCTestCase {

    private var translator: ItemListTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = ItemListTranslatorImpl()
    }
}

// MARK: - Translate Data Tests
extension ItemListTranslatorTests {

    func test_translate() {
        let response = ItemListResponse.stub

        let model = self.translator.convert(from: response)

        model.items.enumerated().forEach {
            XCTAssertEqual($0.element.name.caseInsensitiveCompare(response.results[$0.offset].name), .orderedSame)
            XCTAssertTrue(response.results[$0.offset].url.contains("\($0.element.number)"))
        }
    }
}

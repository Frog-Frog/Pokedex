//
//  ItemListRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
@testable import DataStore

final class ItemListRepositoryTests: XCTestCase {

    private var repository: ItemListRepository!

    private var dataStoreMock: PokeAPIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = PokeAPIDataStoreMock()
        self.repository = ItemListRepositoryImpl(apiDataStore: self.dataStoreMock)
    }

    func test_get_success() {
        self.repository.get { _ in }

        XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
    }
}

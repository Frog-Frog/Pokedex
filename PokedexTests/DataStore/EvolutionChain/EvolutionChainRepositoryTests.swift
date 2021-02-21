//
//  EvolutionChainRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore

class EvolutionChainRepositoryTests: XCTestCase {

    private var repository: EvolutionChainRepository!

    private var dataStoreMock: PokeAPIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = PokeAPIDataStoreMock()
        self.repository = EvolutionChainRepositoryImpl(apiDataStore: self.dataStoreMock)
    }
}

extension EvolutionChainRepositoryTests {

    func test_get() {
        self.repository.get(id: 1) { _ in }

        XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
    }
}

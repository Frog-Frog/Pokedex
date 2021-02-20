//
//  PokemonListRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
@testable import DataStore

final class PokemonListRepositoryTests: XCTestCase {

    private var repository: PokemonListRepository!

    private var dataStoreMock: PokeAPIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = PokeAPIDataStoreMock()
        self.repository = PokemonListRepositoryImpl(apiDataStore: self.dataStoreMock)
    }

    func test_get() {
        self.repository.get { _ in }

        XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
    }

}

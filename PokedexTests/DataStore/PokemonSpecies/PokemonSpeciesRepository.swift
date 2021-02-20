//
//  PokemonSpeciesRepository.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore

class PokemonSpeciesRepositoryTests: XCTestCase {

    private var repository: PokemonSpeciesRepository!

    private var dataStoreMock: PokeAPIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = PokeAPIDataStoreMock()
        self.repository = PokemonSpeciesRepositoryImpl(apiDataStore: self.dataStoreMock)
    }
}

extension PokemonSpeciesRepositoryTests {

    func test_get() {
        self.repository.get(number: 1) { _ in }

        XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
    }
}

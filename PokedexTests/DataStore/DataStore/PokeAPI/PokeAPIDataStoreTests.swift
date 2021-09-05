//
//  PokeAPIDataStoreTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/09/05.
//

import XCTest
@testable import DataStore

final class PokeAPIDataStoreTests: XCTestCase {

    private var pokeAPIDataStore: PokeAPIDataStore!

    private var dataStoreMock: APIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = APIDataStoreMock()
        self.pokeAPIDataStore = PokeAPIDataStoreImpl(dataStore: self.dataStoreMock)
    }
}

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

    private var dataStoreMock: APIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = APIDataStoreMock()
        self.dataStoreMock.requestHandler = { _ in
            return PokemonListResponse.stub
        }
        self.repository = PokemonListRepositoryImpl(apiDataStore: self.dataStoreMock)
    }
}

// MARK: - Get Tests
extension PokemonListRepositoryTests {

    func test_get() {
        Task {
            _ = try await self.repository.get()

            XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
        }
    }
}

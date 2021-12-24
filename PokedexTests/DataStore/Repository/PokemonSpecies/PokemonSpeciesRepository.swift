//
//  PokemonSpeciesRepository.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore

final class PokemonSpeciesRepositoryTests: XCTestCase {

    private var repository: PokemonSpeciesRepository!

    private var dataStoreMock: APIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = APIDataStoreMock()
        self.dataStoreMock.requestHandler = { _ in
            return PokemonSpeciesResponse.stub
        }
        self.repository = PokemonSpeciesRepositoryImpl(apiDataStore: self.dataStoreMock)
    }
}

extension PokemonSpeciesRepositoryTests {

    func test_get() {
        Task {
            _ = try await self.repository.get(number: 1)

            XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
        }
    }
}

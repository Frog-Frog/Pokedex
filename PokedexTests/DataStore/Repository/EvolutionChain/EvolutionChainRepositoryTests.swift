//
//  EvolutionChainRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore

final class EvolutionChainRepositoryTests: XCTestCase {

    private var repository: EvolutionChainRepository!

    private var dataStoreMock: APIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = APIDataStoreMock()
        self.dataStoreMock.requestHandler = { _ in
            return EvolutionChainResponse.bulbasaurStub
        }
        self.repository = EvolutionChainRepositoryImpl(apiDataStore: self.dataStoreMock)
    }
}

extension EvolutionChainRepositoryTests {

    func test_get() {
        Task {
            _ = try await self.repository.get(id: 1)

            XCTAssertEqual(self.dataStoreMock.requestCallCount, 1)
        }
    }
}

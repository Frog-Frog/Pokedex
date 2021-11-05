//
//  PokemonDetailRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import Domain
@testable import DataStore

final class PokemonDetailRepositoryTests: XCTestCase {

    private var repository: PokemonDetailRepository!

    private var apiDataStoreMock: PokeAPIDataStoreMock!
    private var imageDataStoreMock: ImageDataStoreMock!
    private var spotlightDataStoreMock: SpotlightDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.apiDataStoreMock = PokeAPIDataStoreMock()
        self.apiDataStoreMock.requestHandler = { _ in
            return PokemonDetailResponse.bulbasaurStub
        }
        self.imageDataStoreMock = ImageDataStoreMock()
        self.spotlightDataStoreMock = SpotlightDataStoreMock()

        self.repository = PokemonDetailRepositoryImpl(apiDataStore: self.apiDataStoreMock,
                                                      imagaDataStore: self.imageDataStoreMock,
                                                      spotlightDataStore: self.spotlightDataStoreMock)
    }
}

// MARK: - Get Tests
extension PokemonDetailRepositoryTests {

    func test_get() {
        Task {
            _ = try await self.repository.get(number: 1)

            XCTAssertEqual(self.apiDataStoreMock.requestCallCount, 1)
        }
    }
}

// MARK: - SaveSpotLight Tests
extension PokemonDetailRepositoryTests {

    func test_saveSpotlight_nilUrl() {
        let model = PokemonDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: nil)

        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 0)
    }

    func test_saveSpotlight_success() {
        let expectation = self.expectation(description: "Async completed")
        self.imageDataStoreMock.loadHandler = { _ in
            defer {
                expectation.fulfill()
            }
            return Data()
        }

        let model = PokemonDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        self.wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 1)
    }

    func test_saveSpotlight_failure() {
        let expectation = self.expectation(description: "Async completed")
        self.imageDataStoreMock.loadHandler = { _ in
            defer {
                expectation.fulfill()
            }
            throw TestError.stub
        }

        let model = PokemonDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        self.wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 0)
    }
}

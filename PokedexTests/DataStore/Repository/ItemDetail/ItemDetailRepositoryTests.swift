//
//  ItemDetailRepositoryTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import Domain
@testable import DataStore

final class ItemDetailRepositoryTests: XCTestCase {

    private var repository: ItemDetailRepository!

    private var apiDataStoreMock: APIDataStoreMock!
    private var imageDataStoreMock: ImageDataStoreMock!
    private var spotlightDataStoreMock: SpotlightDataStoreMock!

    private var asyncExpectation: XCTestExpectation!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.apiDataStoreMock = APIDataStoreMock()
        self.apiDataStoreMock.requestHandler = { _ in
            return ItemDetailResponse.stub
        }
        self.imageDataStoreMock = ImageDataStoreMock()

        self.spotlightDataStoreMock = SpotlightDataStoreMock()

        self.repository = ItemDetailRepositoryImpl(apiDataStore: self.apiDataStoreMock,
                                                   imagaDataStore: self.imageDataStoreMock,
                                                   spotlightDataStore: self.spotlightDataStoreMock)
    }
}

// MARK: - Get Tests
extension ItemDetailRepositoryTests {

    func test_get() {
        Task {
            _ = try await self.repository.get(number: 1)

            XCTAssertEqual(self.apiDataStoreMock.requestCallCount, 1)
        }
    }
}

// MARK: - SaveSpotLight Tests
extension ItemDetailRepositoryTests {

    func test_saveSpotlight_nilUrl() {
        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: nil)

        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 0)
    }

    func test_saveSpotlight_success() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.imageDataStoreMock.loadHandler = { _ in
            defer {
                self.asyncExpectation.fulfill()
            }
            return Data()
        }

        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 1)
    }

    func test_saveSpotlight_failure() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.imageDataStoreMock.loadHandler = { _ in
            defer {
                self.asyncExpectation.fulfill()
            }
            throw TestError.stub
        }

        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 0)
    }
}

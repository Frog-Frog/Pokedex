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

    private var apiDataStoreMock: PokeAPIDataStoreMock!
    private var imageDataStoreMock: ImageDataStoreMock!
    private var spotlightDataStoreMock: SpotlightDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.apiDataStoreMock = PokeAPIDataStoreMock()
        self.imageDataStoreMock = ImageDataStoreMock()
        self.spotlightDataStoreMock = SpotlightDataStoreMock()

        self.repository = ItemDetailRepositoryImpl(apiDataStore: self.apiDataStoreMock,
                                                   imagaDataStore: self.imageDataStoreMock,
                                                   spotlightDataStore: self.spotlightDataStoreMock)
    }

    func test_get() {
        self.repository.get(number: 1) { _ in }

        XCTAssertEqual(self.apiDataStoreMock.requestCallCount, 1)
    }

    func test_saveSpotlight_nilUrl() {
        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: nil)

        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 0)
    }

    func test_saveSpotlight_success() {
        self.imageDataStoreMock.loadHandler = { _, result in
            return result(.success(Data()))
        }

        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 1)
    }

    func test_saveSpotlight_failure() {
        self.imageDataStoreMock.loadHandler = { _, result in
            return result(.failure(TestError.stub))
        }

        let model = ItemDetailModel.stub
        self.repository.saveSpotlight(number: model.number, name: model.name, imageUrl: model.imageUrl)

        XCTAssertEqual(self.imageDataStoreMock.loadCallCount, 1)
        XCTAssertEqual(self.spotlightDataStoreMock.saveCallCount, 0)
    }
}

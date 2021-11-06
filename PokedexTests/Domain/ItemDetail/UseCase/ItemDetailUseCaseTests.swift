//
//  ItemDetailUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import DataStore
@testable import Domain

final class ItemDetailUseCaseTests: XCTestCase {

    private var useCase: ItemDetailUseCase!

    private var itemDetailRepositoryMock: ItemDetailRepositoryMock!
    private var itemDetailTranslatorMock: ItemDetailTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.itemDetailRepositoryMock = ItemDetailRepositoryMock()
        self.itemDetailTranslatorMock = ItemDetailTranslatorMock()
        self.useCase = ItemDetailUseCaseImpl(repository: self.itemDetailRepositoryMock, translator: self.itemDetailTranslatorMock)
    }
}

// MARK: - ItemDetailRepository Callback Tests
extension ItemDetailUseCaseTests {

    func test_get_success() {
        self.itemDetailRepositoryMock.getHandler = { _ in
            return ItemDetailResponse.stub
        }
        self.itemDetailTranslatorMock.convertHandler = { response in
            return ItemDetailModel(response)
        }

        Task {
            _ = try await self.useCase.get(number: 1)

            XCTAssertEqual(self.itemDetailRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.itemDetailRepositoryMock.saveSpotlightCallCount, 1)
            XCTAssertEqual(self.itemDetailTranslatorMock.convertCallCount, 1)
        }
    }

    func test_get_failure() {
        self.itemDetailRepositoryMock.getHandler = { _ in
            throw TestError.stub
        }

        Task {
            _ = try await self.useCase.get(number: 1)

            XCTAssertEqual(self.itemDetailRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.itemDetailRepositoryMock.saveSpotlightCallCount, 0)
            XCTAssertEqual(self.itemDetailTranslatorMock.convertCallCount, 0)
        }
    }
}

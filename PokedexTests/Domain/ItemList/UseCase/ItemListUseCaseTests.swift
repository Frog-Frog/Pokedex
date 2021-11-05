//
//  ItemListUseCaseTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import DataStore
@testable import Domain

final class ItemListUseCaseTests: XCTestCase {

    private var useCase: ItemListUseCase!

    private var itemListRepositoryMock: ItemListRepositoryMock!
    private var itemListTranslatorMock: ItemListTranslatorMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.itemListRepositoryMock = ItemListRepositoryMock()
        self.itemListTranslatorMock = ItemListTranslatorMock()
        self.useCase = ItemListUseCaseImpl(repository: self.itemListRepositoryMock, translator: self.itemListTranslatorMock)
    }
}

// MARK: - ItemListRepository Callback Tests
extension ItemListUseCaseTests {

    func test_get_success() {
        self.itemListRepositoryMock.getHandler = {
            return ItemListResponse.stub
        }
        self.itemListTranslatorMock.convertHandler = { response in
            return ItemListModel(response)
        }

        Task {
            _ = try await self.useCase.get()

            XCTAssertEqual(self.itemListRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.itemListTranslatorMock.convertCallCount, 1)
        }
    }

    func test_get_failure() {
        self.itemListRepositoryMock.getHandler = {
            throw TestError.stub
        }

        Task {
            _ = try await self.useCase.get()

            XCTAssertEqual(self.itemListRepositoryMock.getCallCount, 1)
            XCTAssertEqual(self.itemListTranslatorMock.convertCallCount, 0)
        }
    }
}

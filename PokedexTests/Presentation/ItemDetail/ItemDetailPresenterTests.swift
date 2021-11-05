//
//  ItemDetailPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import Domain
@testable import Presentation

final class ItemDetailPresenterTests: XCTestCase {

    private var presenter: ItemDetailPresenter!

    private var viewMock: ItemDetailViewMock!
    private var itemDetailUseCaseMock: ItemDetailUseCaseMock!
    private var wireframeMock: ItemDetailWireframeMock!

    private var asyncExpectation: XCTestExpectation!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = ItemDetailViewMock()

        self.viewMock.showItemDetailModelHandler = { _ in
            self.asyncExpectation.fulfill()
        }
        self.viewMock.showErrorAlertHandler = { _ in
            self.asyncExpectation.fulfill()
        }

        self.itemDetailUseCaseMock = ItemDetailUseCaseMock()
        self.itemDetailUseCaseMock.getHandler = { _ in
            return ItemDetailModel.stub
        }

        self.wireframeMock = ItemDetailWireframeMock()

        let presenter = ItemDetailPresenterImpl(number: 1)
        presenter.view = self.viewMock
        presenter.itemDetailUseCase = self.itemDetailUseCaseMock
        presenter.wireframe = self.wireframeMock
        self.presenter = presenter
    }
}

// MARK: - Interface Call Tests
extension ItemDetailPresenterTests {

    func test_viewDidLoad() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.itemDetailUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPop() {
        self.presenter.didSelectPop()
        XCTAssertEqual(self.wireframeMock.popCallCount, 1)
    }
}

// MARK: - ItemDetailUseCase Callback Tests
extension ItemDetailPresenterTests {

    func test_requestItemDetailModel_success() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showItemDetailModelCallCount, 1)
    }

    func test_requestItemDetailModel_failure() {
        self.asyncExpectation = self.expectation(description: "Async completed")
        self.itemDetailUseCaseMock.getHandler = { _ in
            throw TestError.stub
        }
        self.presenter.viewDidLoad()

        self.wait(for: [self.asyncExpectation], timeout: 10.0)
        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

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

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = ItemDetailViewMock()
        self.itemDetailUseCaseMock = ItemDetailUseCaseMock()
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
        self.presenter.viewDidLoad()
        XCTAssertEqual(self.itemDetailUseCaseMock.getCallCount, 1)
    }

    func test_didSelectPop() {
        self.presenter.didSelectPop()
        XCTAssertEqual(self.wireframeMock.popCallCount, 1)
    }
}

// MARK: - ItemDetailUseCase Send Parameter Tests
extension ItemDetailPresenterTests {

    func test_requestItemDetailModel_parameter() {
        self.itemDetailUseCaseMock.getHandler = { number, _ in
            XCTAssertEqual(number, 1)
        }

        self.presenter.viewDidLoad()
    }
}

// MARK: - ItemDetailUseCase Callback Tests
extension ItemDetailPresenterTests {

    func test_requestItemDetailModel_success() {
        self.itemDetailUseCaseMock.getHandler = { _, result in
            result(.success(ItemDetailModel.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showItemDetailModelCallCount, 1)
    }

    func test_requestItemDetailModel_failure() {
        self.itemDetailUseCaseMock.getHandler = { _, result in
            result(.failure(TestError.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

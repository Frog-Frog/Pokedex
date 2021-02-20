//
//  ItemListPresenterTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import XCTest
import Domain
@testable import Presentation

final class ItemListPresenterTests: XCTestCase {

    private var presenter: ItemListPresenter!

    private var viewMock: ItemListViewMock!
    private var itemListUseCaseMock: ItemListUseCaseMock!
    private var wireframeMock: ItemListWireframeMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.viewMock = ItemListViewMock()
        self.itemListUseCaseMock =  ItemListUseCaseMock()
        self.wireframeMock = ItemListWireframeMock()
        let presenter = ItemListPresenterImpl()
        presenter.view = self.viewMock
        presenter.itemListUseCase = self.itemListUseCaseMock
        presenter.wireframe = self.wireframeMock
        self.presenter = presenter
    }
}

// MARK: - Interface Call Tests
extension ItemListPresenterTests {

    func test_viewDidLoad() {
        self.presenter.viewDidLoad()
        XCTAssertEqual(self.itemListUseCaseMock.getCallCount, 1)
    }

    func test_didSelectItem() {
        let item = Item.stub

        self.wireframeMock.pushItemDetailHandler = {
            XCTAssertEqual($0, item.number)
        }

        self.presenter.didSelect(item)
        XCTAssertEqual(self.wireframeMock.pushItemDetailCallCount, 1)
    }
}

// MARK: - ItemListUseCase Callback Tests
extension ItemListPresenterTests {

    func test_requestItemListModel_success() {
        self.itemListUseCaseMock.getHandler = {
            return $0(.success(ItemListModel.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showItemListModelCallCount, 1)
    }

    func test_requestItemListModel_failure() {
        self.itemListUseCaseMock.getHandler = {
            return $0(.failure(TestError.stub))
        }
        self.presenter.viewDidLoad()

        XCTAssertEqual(self.viewMock.showErrorAlertCallCount, 1)
    }
}

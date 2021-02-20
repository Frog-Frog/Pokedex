//
//  ItemDetailPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol ItemDetailPresenter: AnyObject {
    func viewDidLoad()

    func didSelectPop()
}

final class ItemDetailPresenterImpl: ItemDetailPresenter {

    weak var view: ItemDetailView?
    var wireframe: ItemDetailWireframe!
    var itemDetailUseCase: ItemDetailUseCase!

    private let number: Int

    init(number: Int) {
        self.number = number
    }

    func viewDidLoad() {
        self.requestItemDetailModel()
    }

    private func requestItemDetailModel() {
        self.itemDetailUseCase.get(number: self.number) {
            switch $0 {
            case .success(let model):
                self.view?.showItemDetailModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelectPop() {
        self.wireframe.pop()
    }
}

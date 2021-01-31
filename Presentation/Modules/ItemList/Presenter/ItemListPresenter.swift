//
//  ItemListPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol ItemListPresenter: AnyObject {
    func viewDidLoad()
    func didSelect(_ item: ItemListModel.Item)
}

final class ItemListPresenterImpl: ItemListPresenter {

    weak var view: ItemListView?
    var wireframe: ItemListWireframe!
    var itemListUseCase: ItemListUseCase!

    func viewDidLoad() {
        self.itemListUseCase.get {
            switch $0 {
            case .success(let model):
                self.view?.showItemListModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelect(_ item: ItemListModel.Item) {
        // TODO: Make PokemonDetail UI.
        //self.wireframe.pushItemDetail(number: item.number)
    }
}

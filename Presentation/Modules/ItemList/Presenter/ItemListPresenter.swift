//
//  ItemListPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Foundation

protocol ItemListPresenter: AnyObject {}

final class ItemListPresenterImpl: ItemListPresenter {

    weak var view: ItemListView?
    var wireframe: ItemListWireframe!
}

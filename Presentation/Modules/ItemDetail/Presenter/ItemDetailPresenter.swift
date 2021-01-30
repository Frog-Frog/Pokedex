//
//  ItemDetailPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Foundation

protocol ItemDetailPresenter: AnyObject {}

final class ItemDetailPresenterImpl: ItemDetailPresenter {

    weak var view: ItemDetailView?
    var wireframe: ItemDetailWireframe!

    private let number: Int

    init(number: Int) {
        self.number = number
    }
}

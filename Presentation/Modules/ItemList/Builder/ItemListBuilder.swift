//
//  ItemListBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

enum ItemListBuilder {

    static func build() -> UIViewController {
        let view = ItemListViewController.instantiate()
        let presenter = ItemListPresenterImpl()
        let wireframe = ItemListWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe
        presenter.itemListUseCase = ItemListUseCaseProvider.provide()

        wireframe.viewController = view

        return view
    }
}

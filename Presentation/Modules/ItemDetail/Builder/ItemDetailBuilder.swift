//
//  ItemDetailBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

enum ItemDetailBuilder {

    static func build(number: Int) -> UIViewController {
        let view = ItemDetailViewController.instantiate()
        let presenter = ItemDetailPresenterImpl(number: number)
        let wireframe = ItemDetailWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

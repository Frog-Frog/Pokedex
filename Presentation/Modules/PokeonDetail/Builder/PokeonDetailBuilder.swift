//
//  PokeonDetailBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 11/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

enum PokeonDetailBuilder {

    static func build() -> UIViewController {
        let view = PokeonDetailViewController.instantiate()
        let presenter = PokeonDetailPresenterImpl()
        let wireframe = PokeonDetailWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

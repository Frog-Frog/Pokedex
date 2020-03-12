//
//  PokemonDetailBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

enum PokemonDetailBuilder {

    static func build(name: String) -> UIViewController {
        let view = PokemonDetailViewController.instantiate()
        let presenter = PokemonDetailPresenterImpl()
        let wireframe = PokemonDetailWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

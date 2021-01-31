//
//  EvolutionChainBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

enum EvolutionChainBuilder {

    static func build() -> UIViewController {
        let view = EvolutionChainViewController.instantiate()
        let presenter = EvolutionChainPresenterImpl()
        let wireframe = EvolutionChainWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

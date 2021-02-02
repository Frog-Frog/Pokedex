//
//  EvolutionChainBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

enum EvolutionChainBuilder {

    static func build(evolutionChainId: Int, delegate: EvolutionChainWireframeDelegate) -> UIViewController {
        let view = EvolutionChainViewController.instantiate()
        let presenter = EvolutionChainPresenterImpl(evolutionChainId: evolutionChainId)
        let wireframe = EvolutionChainWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe
        presenter.evolutionChainUseCase = EvolutionChainUseCaseProvider.provide()

        wireframe.viewController = view
        wireframe.delegate = delegate

        return view
    }
}

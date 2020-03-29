//
//  PokemonDetailBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

enum PokemonDetailBuilder {

    static func build(name: String) -> UIViewController {
        let view = PokemonDetailViewController.instantiate()
        let presenter = PokemonDetailPresenterImpl(name: name)
        let wireframe = PokemonDetailWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe
        presenter.pokemonDetailUseCase = PokemonDetailUseCaseProvider.provide()
        presenter.favoritePokemonUseCase = FavoritePokemonUseCaseProvider.provide()

        wireframe.viewController = view

        return view
    }
}

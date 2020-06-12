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

    static func build(number: Int) -> UIViewController {
        let view = PokemonDetailViewController.instantiate()
        let presenter = PokemonDetailPresenterImpl(number: number)
        let wireframe = PokemonDetailWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe
        presenter.pokemonDetailUseCase = PokemonDetailUseCaseProvider.provide()
        presenter.pokemonSpeciesUseCase = PokemonSpeciesUseCaseProvider.provide()

        wireframe.viewController = view

        return view
    }
}

//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain

protocol PokemonListPresenter {}

final class PokemonListPresenterImpl: PokemonListPresenter {

    weak var view: PokemonListView?
    var wireframe: PokemonListWireframe!
    var pokemonListUseCase: PokemonListUseCase!
}

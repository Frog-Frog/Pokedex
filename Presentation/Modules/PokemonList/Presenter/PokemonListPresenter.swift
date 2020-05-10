//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol PokemonListPresenter {
    func requestPokemonListModel()

    func didSelect(_ pokemon: PokemonListModel.Pokemon)
}

final class PokemonListPresenterImpl: PokemonListPresenter {

    weak var view: PokemonListView?
    var wireframe: PokemonListWireframe!
    var pokemonListUseCase: PokemonListUseCase!

    func requestPokemonListModel() {
        self.pokemonListUseCase.get { response in
            switch response {
            case .success(let model):
                self.view?.showPokemonListModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelect(_ pokemon: PokemonListModel.Pokemon) {
        self.wireframe.pushPokemonDetail(number: pokemon.number)
    }
}

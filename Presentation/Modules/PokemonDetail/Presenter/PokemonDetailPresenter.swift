//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol PokemonDetailPresenter: AnyObject {
    func requestPokemonDetailModel()
    func didSelect(_ isFavorite: Bool)
}

final class PokemonDetailPresenterImpl: PokemonDetailPresenter {

    weak var view: PokemonDetailView?
    var wireframe: PokemonDetailWireframe!
    var pokemonDetailUseCase: PokemonDetailUseCase!
    var favoritePokemonUseCase: FavoritePokemonUseCase!

    private let name: String
    private var number = 0

    init(name: String) {
        self.name = name
    }

    func requestPokemonDetailModel() {
        self.pokemonDetailUseCase.get(name: self.name) { result in
            switch result {
            case .success(let model):
                self.number = model.number
                self.view?.showPokemonDetailModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelect(_ isFavorite: Bool) {
        let pokemon = (number: self.number, name: self.name)
        if isFavorite {
            self.favoritePokemonUseCase.add(pokemon)
        } else {
            self.favoritePokemonUseCase.remove(pokemon)
        }
    }
}

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

    func didSelectPop()
}

final class PokemonDetailPresenterImpl: PokemonDetailPresenter {

    weak var view: PokemonDetailView?
    var wireframe: PokemonDetailWireframe!
    var pokemonDetailUseCase: PokemonDetailUseCase!

    private let number: Int

    init(number: Int) {
        self.number = number
    }

    func requestPokemonDetailModel() {
        self.pokemonDetailUseCase.get(number: self.number) { result in
            switch result {
            case .success(let model):
                self.view?.showPokemonDetailModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelectPop() {
        self.wireframe.pop()
    }
}

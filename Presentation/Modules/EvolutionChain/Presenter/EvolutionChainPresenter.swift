//
//  EvolutionChainPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol EvolutionChainPresenter: AnyObject {
    func viewDidLoad()

    func didSelect(_ pokemon: Pokemon)
    func didSelectClose()
}

final class EvolutionChainPresenterImpl: EvolutionChainPresenter {

    weak var view: EvolutionChainView?
    var wireframe: EvolutionChainWireframe!
    var evolutionChainUseCase: EvolutionChainUseCase!

    let evolutionChainId: Int

    init(evolutionChainId: Int) {
        self.evolutionChainId = evolutionChainId
    }

    func viewDidLoad() {
        self.evolutionChainUseCase.get(id: self.evolutionChainId) {
            switch $0 {
            case .success(let model):
                self.view?.showEvolutionChainModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelect(_ pokemon: Pokemon) {
        self.wireframe.dismissWithPushPokemonDetail(number: pokemon.number)
    }

    func didSelectClose() {
        self.wireframe.dismiss()
    }
}

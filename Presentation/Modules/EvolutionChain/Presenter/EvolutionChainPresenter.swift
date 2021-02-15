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

    let evolutionChainModel: EvolutionChainModel

    init(evolutionChainModel: EvolutionChainModel) {
        self.evolutionChainModel = evolutionChainModel
    }

    func viewDidLoad() {
        self.view?.showEvolutionChainModel(evolutionChainModel)
    }

    func didSelect(_ pokemon: Pokemon) {
        self.wireframe.dismissWithPushPokemonDetail(number: pokemon.number)
    }

    func didSelectClose() {
        self.wireframe.dismiss(animated: false)
    }
}

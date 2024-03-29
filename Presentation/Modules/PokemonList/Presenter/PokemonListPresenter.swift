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
    func viewDidLoad()

    func didSelect(_ pokemon: Pokemon)
}

final class PokemonListPresenterImpl: PokemonListPresenter {

    weak var view: PokemonListView?
    var wireframe: PokemonListWireframe!
    var pokemonListUseCase: PokemonListUseCase!

    func viewDidLoad() {
        self.requestPokemonListModel()
    }

    private func requestPokemonListModel() {
        Task { @MainActor in
            do {
                let model = try await self.pokemonListUseCase.get()
                self.view?.showPokemonListModel(model)
            } catch {
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelect(_ pokemon: Pokemon) {
        self.wireframe.pushPokemonDetail(number: pokemon.number)
    }
}

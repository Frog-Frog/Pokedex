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
    func requestPokemonListData()

    func didSelect(_ pokemon: PokemonListData.Pokemon)
}

final class PokemonListPresenterImpl: PokemonListPresenter {

    weak var view: PokemonListView?
    var wireframe: PokemonListWireframe!
    var pokemonListUseCase: PokemonListUseCase!

    func requestPokemonListData() {
        self.pokemonListUseCase.get { response in
            switch response {
            case .success(let data):
                self.view?.showPokemonListData(data)
            case .failure(let error):
                // TODO: エラー表示
                break
            }
        }
    }

    func didSelect(_ pokemon: PokemonListData.Pokemon) {
        self.wireframe.pushPokemonDetail(name: pokemon.name)
    }
}

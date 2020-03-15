//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import Foundation

protocol PokemonDetailPresenter: class {
    func requestPokemonDetailData()
}

final class PokemonDetailPresenterImpl: PokemonDetailPresenter {

    weak var view: PokemonDetailView?
    var wireframe: PokemonDetailWireframe!
    var pokemonDetailUseCase: PokemonDetailUseCase!
    var favoritePokemonUseCase: FavoritePokemonUseCase!

    private let name: String

    init(name: String) {
        self.name = name
    }

    func requestPokemonDetailData() {
        self.pokemonDetailUseCase.get(name: self.name) { result in
            switch result {
            case .success(let data):
                self.view?.showPokemonDetailData(data)
            case .failure(let error):
                // TODO: エラー処理
                return
            }
        }
    }
}

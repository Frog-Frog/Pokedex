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
    func viewDidLoad()

    func didSelectPop()

    func didTapDegeneration()
}

final class PokemonDetailPresenterImpl: PokemonDetailPresenter {

    weak var view: PokemonDetailView?
    var wireframe: PokemonDetailWireframe!
    var pokemonDetailUseCase: PokemonDetailUseCase!
    var pokemonSpeciesUseCase: PokemonSpeciesUseCase!

    private var number: Int

    private var degenerationId: Int?

    init(number: Int) {
        self.number = number
    }

    func viewDidLoad() {
        self.requestPokemonDetailModel()
        self.requestPokemonSpeciesModel()
    }

    private func requestPokemonDetailModel() {
        self.pokemonDetailUseCase.get(number: self.number) { result in
            switch result {
            case .success(let model):
                self.view?.showPokemonDetailModel(model)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    private func requestPokemonSpeciesModel() {
        self.pokemonSpeciesUseCase.get(number: self.number) { result in
            switch result {
            case .success(let model):
                self.degenerationId = model.degenerationId
                self.view?.showDegeneration(self.degenerationId == nil)
            case .failure(let error):
                self.view?.showErrorAlert(error)
            }
        }
    }

    func didSelectPop() {
        self.wireframe.pop()
    }

    func didTapDegeneration() {
        guard let number = self.degenerationId else {
            return
        }
        self.wireframe.pushPokemonDetail(number: number)
    }
}

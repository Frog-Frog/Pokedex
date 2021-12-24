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
    func didSelectEvolutionChain()
}

final class PokemonDetailPresenterImpl: PokemonDetailPresenter {

    weak var view: PokemonDetailView?
    var wireframe: PokemonDetailWireframe!
    var pokemonDetailUseCase: PokemonDetailUseCase!
    var pokemonSpeciesUseCase: PokemonSpeciesUseCase!
    var evolutionChainUseCase: EvolutionChainUseCase!

    private let number: Int

    private var evolutionChainModel: EvolutionChainModel?

    init(number: Int) {
        self.number = number
    }

    func viewDidLoad() {
        self.requestPokemonDetailModel()
        self.requestEvolutionChainModel()
    }

    private func requestPokemonDetailModel() {
        Task { @MainActor in
            do {
                let model = try await self.pokemonDetailUseCase.get(number: self.number)
                self.view?.showPokemonDetailModel(model)
            } catch {
                self.view?.showErrorAlert(error)
            }
        }
    }

    private func requestEvolutionChainModel() {
        Task { @MainActor in
            do {
                let species = try await self.pokemonSpeciesUseCase.get(number: self.number)
                let evolutionChain = try await self.evolutionChainUseCase.get(id: species.evolutionChainId)
                self.evolutionChainModel = evolutionChain
                self.view?.showEvolutionChain(evolutionChain.chainType == .none)
            } catch {
                self.view?.showEvolutionChain(true)
            }
        }
    }

    func didSelectPop() {
        self.wireframe.pop()
    }

    func didSelectEvolutionChain() {
        guard let model = self.evolutionChainModel else {
            return
        }
        self.wireframe.presentEvolutionChain(evolutionChainModel: model, delegate: self.wireframe)
    }
}

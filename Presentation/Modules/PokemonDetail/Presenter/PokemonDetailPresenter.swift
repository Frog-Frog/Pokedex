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
        self.requestPokemonSpeciesModel()
    }

    private func requestPokemonDetailModel() {
        if #available(iOS 15.0.0, *) {
            Task { @MainActor in
                do {
                    let model = try await self.pokemonDetailUseCase.get(number: self.number)
                    self.view?.showPokemonDetailModel(model)
                } catch {
                    self.view?.showErrorAlert(error)
                }
            }
        } else {
            self.pokemonDetailUseCase.get(number: self.number) { result in
                switch result {
                case .success(let model):
                    self.view?.showPokemonDetailModel(model)
                case .failure(let error):
                    self.view?.showErrorAlert(error)
                }
            }
        }
    }

    private func requestPokemonSpeciesModel() {
        if #available(iOS 15.0.0, *) {
            Task {
                do {
                    let model = try await self.pokemonSpeciesUseCase.get(number: self.number)
                    self.requestEvolutionChainModel(model.evolutionChainId)
                } catch {
                    self.view?.showErrorAlert(error)
                }
            }
        } else {
            self.pokemonSpeciesUseCase.get(number: self.number) { result in
                switch result {
                case .success(let model):
                    self.requestEvolutionChainModel(model.evolutionChainId)
                case .failure(let error):
                    self.view?.showErrorAlert(error)
                }
            }
        }
    }

    private func requestEvolutionChainModel(_ evolutionChainId: Int) {
        if #available(iOS 15.0.0, *) {
            Task {
                do {
                    let model = try await self.evolutionChainUseCase.get(id: evolutionChainId)
                    self.evolutionChainModel = model
                    self.view?.showEvolutionChain(model.chainType == .none)
                } catch {
                    self.view?.showErrorAlert(error)
                }
            }
        } else {
            self.evolutionChainUseCase.get(id: evolutionChainId) { result in
                switch result {
                case .success(let model):
                    self.evolutionChainModel = model
                    self.view?.showEvolutionChain(model.chainType == .none)
                case .failure(let error):
                    self.view?.showErrorAlert(error)
                }
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

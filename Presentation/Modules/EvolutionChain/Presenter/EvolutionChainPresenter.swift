//
//  EvolutionChainPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Foundation

protocol EvolutionChainPresenter: AnyObject {}

final class EvolutionChainPresenterImpl: EvolutionChainPresenter {

    weak var view: EvolutionChainView?
    var wireframe: EvolutionChainWireframe!
}

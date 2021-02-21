//
//  PokemonDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

/// @mockable
protocol PokemonDetailWireframe: PopWireframe, TransitToEvolutionChainWireframe, EvolutionChainWireframeDelegate {}

final class PokemonDetailWireframeImpl: PokemonDetailWireframe {

    weak var viewController: UIViewController?
}

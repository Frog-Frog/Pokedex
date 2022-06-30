//
//  PokemonListWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

/// @mockable
protocol PokemonListWireframe: TransitToPokemonDetailWireframe {}

final class PokemonListWireframeImpl: PokemonListWireframe {

    weak var viewController: UIViewController?
}

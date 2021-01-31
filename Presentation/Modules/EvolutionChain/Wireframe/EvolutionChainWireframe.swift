//
//  EvolutionChainWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol EvolutionChainWireframe: AnyObject {}

final class EvolutionChainWireframeImpl: EvolutionChainWireframe {

    weak var viewController: UIViewController?
}

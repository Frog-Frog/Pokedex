//
//  EvolutionChainWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol EvolutionChainWireframe: DismissWireframe {
    func dismissWithPushPokemonDetail(number: Int)
}

final class EvolutionChainWireframeImpl: EvolutionChainWireframe {

    weak var viewController: UIViewController?

    weak var delegate: EvolutionChainWireframeDelegate?

    func dismissWithPushPokemonDetail(number: Int) {
        self.dismiss(animated: false) {
            self.delegate?.pushPokemonDetail(number: number)
        }
    }
}

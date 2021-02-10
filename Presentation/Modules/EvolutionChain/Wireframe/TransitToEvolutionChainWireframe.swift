//
//  TransitToEvolutionChainWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToEvolutionChainWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func presentEvolutionChain(evolutionChainId: Int, delegate: EvolutionChainWireframeDelegate)
}

extension TransitToEvolutionChainWireframe {

    func presentEvolutionChain(evolutionChainId: Int, delegate: EvolutionChainWireframeDelegate) {
        let vc = EvolutionChainBuilder.build(evolutionChainId: evolutionChainId, delegate: delegate)
        self.viewController?.present(vc, animated: false, completion: nil)
    }
}

protocol EvolutionChainWireframeDelegate: TransitToPokemonDetailWireframe {}

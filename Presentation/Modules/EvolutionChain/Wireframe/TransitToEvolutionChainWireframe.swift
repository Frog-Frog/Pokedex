//
//  TransitToEvolutionChainWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol TransitToEvolutionChainWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func presentEvolutionChain(evolutionChainModel: EvolutionChainModel, delegate: EvolutionChainWireframeDelegate)
}

extension TransitToEvolutionChainWireframe {

    func presentEvolutionChain(evolutionChainModel: EvolutionChainModel, delegate: EvolutionChainWireframeDelegate) {
        let vc = EvolutionChainBuilder.build(evolutionChainModel: evolutionChainModel, delegate: delegate)
        self.viewController?.present(vc, animated: false, completion: nil)
    }
}

protocol EvolutionChainWireframeDelegate: TransitToPokemonDetailWireframe {}

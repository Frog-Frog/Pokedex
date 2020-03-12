//
//  TransitToPokemonDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToPokemonDetailWireframe: class {

    var viewController: UIViewController? { get }

    func pushPokemonDetail(name: String)
}

extension TransitToPokemonDetailWireframe {

    func pushPokemonDetail(name: String) {
        let vc = PokemonDetailBuilder.build(name: name)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

//protocol PokemonDetailWireframeDelegate: class {}

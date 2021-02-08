//
//  TransitToPokemonDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToPokemonDetailWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func pushPokemonDetail(number: Int)
}

extension TransitToPokemonDetailWireframe {

    func pushPokemonDetail(number: Int) {
        let vc = PokemonDetailBuilder.build(number: number)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

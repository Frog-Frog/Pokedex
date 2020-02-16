//
//  TransitToPokemonListWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToPokemonListWireframe {

    var viewController: UIViewController { get }

    // func pushPokemonList()
    // func presentPokemonList()
}

extension TransitToPokemonListWireframe {

    //func pushPokemonList() {
    //    let vc = PokemonListBuilder.build()
    //    self.viewController?.navigationController?.pushViewController(vc, animated: true)
    //}

    //func presentPokemonList() {
    //    let vc = PokemonListBuilder.build()
    //    self.viewController?.present(vc, animated: true, completion: nil)
    //}
}

//protocol PokemonListWireframeDelegate: class {}

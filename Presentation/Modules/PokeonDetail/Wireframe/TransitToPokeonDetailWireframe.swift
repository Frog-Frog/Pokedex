//
//  TransitToPokeonDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 11/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToPokeonDetailWireframe: class {

    var viewController: UIViewController { get }

    // func pushPokeonDetail()
    // func presentPokeonDetail()
}

extension TransitToPokeonDetailWireframe {

    //func pushPokeonDetail() {
    //    let vc = PokeonDetailBuilder.build()
    //    self.viewController?.navigationController?.pushViewController(vc, animated: true)
    //}

    //func presentPokeonDetail() {
    //    let vc = PokeonDetailBuilder.build()
    //    self.viewController?.present(vc, animated: true, completion: nil)
    //}
}

//protocol PokeonDetailWireframeDelegate: class {}

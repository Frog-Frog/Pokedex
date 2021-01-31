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

    // func pushEvolutionChain()
    // func presentEvolutionChain()
}

extension TransitToEvolutionChainWireframe {

    //func pushEvolutionChain() {
    //    let vc = EvolutionChainBuilder.build()
    //    self.viewController?.navigationController?.pushViewController(vc, animated: true)
    //}

    //func presentEvolutionChain() {
    //    let vc = EvolutionChainBuilder.build()
    //    self.viewController?.present(vc, animated: true, completion: nil)
    //}
}

//protocol EvolutionChainWireframeDelegate: AnyObject {}

//
//  Tab.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import UIKit

enum Tab: CaseIterable {
    case pokemonList
    
    var viewController: UIViewController {
        switch self {
        case .pokemonList:
            return PokemonListBuilder.build()
        }
    }
}

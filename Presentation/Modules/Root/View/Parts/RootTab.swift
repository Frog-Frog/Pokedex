//
//  RootTab.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/01/29.
//

import UIKit

extension RootViewController {

    enum Tab: Int, CaseIterable {
        case pokemonList
        case itemList

        var viewController: UIViewController {
            switch self {
            case .pokemonList:
                return PokemonListBuilder.build()
            case .itemList:
                return ItemListBuilder.build()
            }
        }

        var image: UIImage {
            switch self {
            case .pokemonList:
                return Asset.tabPokemonDeselect.image
            case .itemList:
                return Asset.tabItemDeselect.image
            }
        }

        var selectedImage: UIImage {
            switch self {
            case .pokemonList:
                return Asset.tabPokemonSelect.image
            case .itemList:
                return Asset.tabItemSelect.image
            }
        }
    }
}

//
//  PokedexTab.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/11.
//

import UIKit

enum PokedexTab: Int, CaseIterable {
    case pokemon
    case item

    var viewController: UIViewController {
        switch self {
        case .pokemon:
            return PokemonListBuilder.build()
        case .item:
            return ItemListBuilder.build()
        }
    }

    var image: UIImage {
        switch self {
        case .pokemon:
            return Asset.tabPokemonDeselect.image
        case .item:
            return Asset.tabItemDeselect.image
        }
    }

    var selectedImage: UIImage {
        switch self {
        case .pokemon:
            return Asset.tabPokemonSelect.image
        case .item:
            return Asset.tabItemSelect.image
        }
    }
}

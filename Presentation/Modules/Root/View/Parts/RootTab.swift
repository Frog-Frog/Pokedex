//
//  RootTab.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/01/29.
//

import UIKit

extension RootViewController {

    enum Tab: CaseIterable {
        case pokemonList
        case itemList

        var viewController: UIViewController {
            let viewController: UIViewController = {
                switch self {
                case .pokemonList:
                    return PokemonListBuilder.build()
                case .itemList:
                    return ItemListBuilder.build()
                }
            }()
            viewController.tabBarItem = self.tabBarItem
            return viewController
        }

        private var tabBarItem: UITabBarItem {
            let tabBarItem = UITabBarItem(title: self.title, image: self.image, selectedImage: self.selectedImage)
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Asset.textBlack.color], for: .selected)
            return tabBarItem
        }

        private var title: String {
            switch self {
            case .pokemonList:
                return "Pokémon"
            case .itemList:
                return "Item"
            }
        }

        private var image: UIImage {
            let image: UIImage = {
                switch self {
                case .pokemonList:
                    return Asset.tabPokemonDeselect.image
                case .itemList:
                    return Asset.tabItemDeselect.image
                }
            }()
            return image.withRenderingMode(.alwaysOriginal)
        }

        private var selectedImage: UIImage {
            let image: UIImage = {
                switch self {
                case .pokemonList:
                    return Asset.tabPokemonSelect.image
                case .itemList:
                    return Asset.tabItemSelect.image
                }
            }()
            return image.withRenderingMode(.alwaysOriginal)
        }
    }
}

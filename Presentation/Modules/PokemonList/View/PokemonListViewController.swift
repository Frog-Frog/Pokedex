//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol PokemonListView {}

// MARK: - vars and life cycle
final class PokemonListViewController: UIViewController {

    var presenter: PokemonListPresenter!
}

// MARK: - Life cycle
extension PokemonListViewController: {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - PokemonListView
extension PokemonListViewController: PokemonListView {
}

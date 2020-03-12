//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol PokemonDetailView: class {
    func showPokemonDetailData(_ data: PokemonDetailData)
}

// MARK: - vars and life cycle
final class PokemonDetailViewController: UIViewController {

    var presenter: PokemonDetailPresenter!
}

// MARK: - Life cycle
extension PokemonDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.requestPokemonDetailData()
    }
}

// MARK: - PokemonDetailView
extension PokemonDetailViewController: PokemonDetailView {

    func showPokemonDetailData(_ data: PokemonDetailData) {

    }
}

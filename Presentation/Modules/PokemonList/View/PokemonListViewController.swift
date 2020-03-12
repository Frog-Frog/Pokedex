//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import Nuke
import UIKit

protocol PokemonListView: class {
    func showPokemonListViewData(_ data: PokemonListViewData)
}

// MARK: - vars and life cycle
final class PokemonListViewController: UIViewController {

    var presenter: PokemonListPresenter!

    var pokemons = [PokemonListViewData.Pokemon]()

    @IBOutlet private weak var tableView: UITableView! {
        willSet {
            newValue.register(PokemonListCell.self)
        }
    }
}

// MARK: - Life cycle
extension PokemonListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.requestPokemonListData()
    }
}

// MARK: - PokemonListView
extension PokemonListViewController: PokemonListView {

    func showPokemonListViewData(_ data: PokemonListViewData) {
        self.pokemons = data.pokemons
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PokemonListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setData(self.pokemons[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension PokemonListViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let pokemons = indexPaths.map { self.pokemons[$0.row] }
        let urls = pokemons.compactMap { URL(string: $0.imageUrl) }
        ImagePreheater().startPreheating(with: urls)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        let pokemons = indexPaths.map { self.pokemons[$0.row] }
        let urls = pokemons.compactMap { URL(string: $0.imageUrl) }
        ImagePreheater().stopPreheating(with: urls)
    }
}

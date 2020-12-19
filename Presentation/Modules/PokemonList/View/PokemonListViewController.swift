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

protocol PokemonListView: ShowErrorAlertView {
    func showPokemonListModel(_ model: PokemonListModel)
}

// MARK: - vars
final class PokemonListViewController: UIViewController {

    var presenter: PokemonListPresenter!

    var pokemons = [PokemonListModel.Pokemon]()

    @IBOutlet private weak var tableView: BaseTableView! {
        willSet {
            newValue.register(PokemonListCell.self)
            newValue.contentInset.top = 24
            newValue.contentInset.bottom = 16
        }
    }
}

// MARK: - Life cycle
extension PokemonListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
    }
}

// MARK: - Setup
extension PokemonListViewController {

    private func setupNavigationBar() {
        self.navigationItem.titleView =  {
            let imageView = UIImageView(image: Asset.logo.image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    }
}

// MARK: - PokemonListView
extension PokemonListViewController: PokemonListView {

    func showPokemonListModel(_ model: PokemonListModel) {
        self.pokemons = model.pokemons
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
        cell.setData(self.pokemons[indexPath.row], delegate: self)
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension PokemonListViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.pokemons[$0.row].imageUrl }
        ImagePreheater().startPreheating(with: urls)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.pokemons[$0.row].imageUrl }
        ImagePreheater().stopPreheating(with: urls)
    }
}

// MARK: - UITableViewDelegate
extension PokemonListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PokemonListCell else { return }
        cell.abbreviate()
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.expand()
        }, completion: nil)
    }
}

// MARK: - PokemonListCellDelegate
extension PokemonListViewController: PokemonListCellDelegate {

    func didTapPokemonListCell(pokemon: PokemonListModel.Pokemon) {
        self.presenter.didSelect(pokemon)
    }
}

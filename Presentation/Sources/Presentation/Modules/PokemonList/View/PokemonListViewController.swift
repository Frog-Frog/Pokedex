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

/// @mockable
protocol PokemonListView: ShowErrorAlertView {
    func showPokemonListModel(_ model: PokemonListModel)
}

// MARK: - vars
final class PokemonListViewController: UIViewController {

    var presenter: PokemonListPresenter!

    var pokemons = [Pokemon]()

    @IBOutlet private weak var tableView: BaseTableView! {
        willSet {
            newValue.register(PokemonListCell.self)
        }
    }

    @IBOutlet private weak var slider: VerticalSlider! {
        willSet {
            newValue.setThumbImage(Asset.sliderThumb.image, for: .normal)
        }
    }

    @IBOutlet private var gradationViews: [GradationView]! {
        willSet {
            newValue.forEach { $0.setGradation() }
        }
    }
}

// MARK: - Life cycle
extension PokemonListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - PokemonListView
extension PokemonListViewController: PokemonListView {

    func showPokemonListModel(_ model: PokemonListModel) {
        self.pokemons = model.pokemons

        self.tableView.contentInset.top = self.tableView.bounds.height/2
        self.tableView.contentInset.bottom = self.tableView.bounds.height/2

        self.tableView.reloadData {
            self.slider.minimumValue = -Float(self.tableView.contentInset.top)
            self.slider.maximumValue = Float(self.tableView.contentSize.height - self.tableView.bounds.height + self.tableView.contentInset.bottom)
            self.slider.setValue(self.slider.minimumValue, animated: false)
        }
    }
}

// MARK: - IBAction
extension PokemonListViewController {

    @IBAction private func didChangeValue(_ sender: UISlider) {
        self.tableView.setContentOffset(.init(x: 0, y: CGFloat(sender.value)), animated: false)
    }
}

// MARK: - UIScrollViewDelegate
extension PokemonListViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.slider.value = Float(scrollView.contentOffset.y)
    }
}

// MARK: - UITableViewDataSource
extension PokemonListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setPokemon(self.pokemons[indexPath.row], delegate: self)
        return cell
    }
}

// MARK: - UITableViewDataSourcePrefetching
extension PokemonListViewController: UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.pokemons[$0.row].imageUrl }
        ImagePrefetcher().startPrefetching(with: urls)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap { self.pokemons[$0.row].imageUrl }
        ImagePrefetcher().stopPrefetching(with: urls)
    }
}

// MARK: - UITableViewDelegate
extension PokemonListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PokemonListCell else { return }
        cell.abbreviate()
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            cell.expand()
        }, completion: nil)
    }
}

// MARK: - PokemonListCellDelegate
extension PokemonListViewController: PokemonListCellDelegate {

    func didTapPokemonListCell(pokemon: Pokemon) {
        self.presenter.didSelect(pokemon)
    }
}

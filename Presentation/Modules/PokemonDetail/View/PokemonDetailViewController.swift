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

    private var segments = [PokemonDetailData.Segment]()

    @IBOutlet private weak var tableView: UITableView!
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
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PokemonDetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.segments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath)
    }
}

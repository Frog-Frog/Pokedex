//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 12/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol PokemonDetailView: ShowErrorAlertView {
    func showPokemonDetailModel(_ model: PokemonDetailModel)
}

// MARK: - vars
final class PokemonDetailViewController: UIViewController {

    var presenter: PokemonDetailPresenter!

    private var segments = [PokemonDetailModel.Segment]()

    @IBOutlet private weak var favoriteButton: PokemonDetailFavoriteButton! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var tableView: UITableView! {
        willSet {
            PokemonDetailModel.Segment.Content.allCellType.forEach { newValue.register($0) }
        }
    }
}

// MARK: - Life cycle
extension PokemonDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.requestPokemonDetailModel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barTintColor = Asset.navigationBar.color
    }
}

// MARK: - PokemonDetailView
extension PokemonDetailViewController: PokemonDetailView {

    func showPokemonDetailModel(_ model: PokemonDetailModel) {
        self.title = "No.\(model.number) \(model.name)"
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: model.typeHex)

        self.segments = model.segments
        self.tableView.reloadData()

        self.favoriteButton.isHidden = false
        self.favoriteButton.isFavorite = model.isFavorite
    }
}

// MARK: - UITableViewDataSource
extension PokemonDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        self.segments.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.segments[section].contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = self.segments[indexPath.section].contents[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: content.cellType.className, for: indexPath)
        switch self.segments[indexPath.section].contents[indexPath.row] {
        case .singleImage(let frontImageUrl):
            (cell as! PokemonDetailSingleImageCell).setData(frontImageUrl)
        case .dualImage(let frontImageUrl, let backImageUrl):
            (cell as! PokemonDetailDualImageCell).setData(frontImageUrl: frontImageUrl, backImageUrl: backImageUrl)
        case .pokemonTypes(let types):
            (cell as! PokemonDetailPokemonTypeCell).setData(types)
        case .height(let height):
            (cell as! PokemonDetailHeightCell).setData(height)
        case .weight(let weight):
            (cell as! PokemonDetailWeightCell).setData(weight)
        case .status(let status):
            (cell as! PokemonDetailStatusCell).setData(status)
        }
        return cell
    }
}

// MARK: - PokemonDetailFavoriteButtonDelegate
extension PokemonDetailViewController: PokemonDetailFavoriteButtonDelegate {

    func button(_ button: PokemonDetailFavoriteButton, didToggle isFavorite: Bool) {
        self.presenter.didSelect(isFavorite)
    }
}

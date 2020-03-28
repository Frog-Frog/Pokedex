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

    @IBOutlet private weak var tableView: UITableView! {
        willSet {
            PokemonDetailData.Segment.Content.allCellType.forEach { newValue.register($0) }
        }
    }
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
        self.title = "No.\(data.number) \(data.name)"
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: data.typeHex)
        self.segments = data.segments
        self.tableView.reloadData()
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
        case .image(let args):
            (cell as! PokemonDetailImageCell).setData(frontImageUrl: args.frontImageUrl, backImageUrl: args.backImageUrl)
        case .pokemonTypes(let types):
            (cell as! PokemonDetailPokemonTypeCell).setData(types)
        case .height(let height):
            (cell as! PokemonDetailHeightCell).setData(height)
        case .weight(let weight):
            (cell as! PokemonDetailWeightCell).setData(weight)
        }
        return cell
    }
}

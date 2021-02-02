//
//  EvolutionChainCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Domain
import UIKit

final class EvolutionChainCell: UICollectionViewCell {

    @IBOutlet private weak var tableView: UITableView! {
        willSet {
            newValue.register(EvolutionChainPokemonCell.self)
        }
    }

    private var pokemons = [EvolutionChainModel.EvolutionChain.Pokemon]()

    func setData(_ data: EvolutionChainModel.EvolutionChain) {
        self.pokemons = data.pokemons
        self.tableView.reloadData()
    }
}

extension EvolutionChainCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EvolutionChainPokemonCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setData(self.pokemons[indexPath.row], delegate: self)
        return cell
    }
}

extension EvolutionChainCell: EvolutionChainPokemonCellDelegate {

    func cell(_ cell: EvolutionChainPokemonCell, didSelect pokemon: EvolutionChainModel.EvolutionChain.Pokemon) {

    }
}

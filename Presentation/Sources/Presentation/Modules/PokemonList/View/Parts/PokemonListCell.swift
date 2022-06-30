//
//  PokemonListCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Domain
import UIKit

protocol PokemonListCellDelegate: AnyObject {
    func didTapPokemonListCell(pokemon: Pokemon)
}

final class PokemonListCell: UITableViewCell {

    @IBOutlet private weak var pokemonView: PokemonView!

    private weak var delegate: PokemonListCellDelegate?

    func setPokemon(_ pokemon: Pokemon, delegate: PokemonListCellDelegate) {
        self.delegate = delegate
        self.pokemonView.setPokemon(pokemon, delegate: self)
    }

    func abbreviate() {
        self.pokemonView.abbreviate()
    }

    func expand() {
        self.pokemonView.expand()
    }
}

// MARK: - PokemonViewDelegate
extension PokemonListCell: PokemonViewDelegate {

    func didTapPokemonView(_ pokemon: Pokemon) {
        self.delegate?.didTapPokemonListCell(pokemon: pokemon)
    }
}

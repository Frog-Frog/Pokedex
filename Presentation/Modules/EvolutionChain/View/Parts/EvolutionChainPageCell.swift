//
//  EvolutionChainPageCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/10.
//

import Domain
import UIKit

protocol EvolutionChainPageCellDelegate: AnyObject {

    func cell(_ cell: EvolutionChainPageCell, didTap pokemon: Pokemon)
}

final class EvolutionChainPageCell: UICollectionViewCell {

    @IBOutlet private weak var stackView: UIStackView!

    private weak var delegate: EvolutionChainPageCellDelegate?

    override func prepareForReuse() {
        self.stackView.removeAllArrangedSubviews()
    }

    func setEvolutionChain(_ evolutionChain: EvolutionChainModel.EvolutionChain, delegate: EvolutionChainPageCellDelegate) {
        self.delegate = delegate

        let pokemonViews: [PokemonView] = evolutionChain.pokemons.map {
            let view = PokemonView()
            view.setPokemon($0, delegate: self)
            return view
        }
        pokemonViews.forEach { self.stackView.addArrangedSubview($0) }
    }

    func setIsActive(_ isActive: Bool) {
        if isActive {
            self.stackView.alpha = 1
        } else {
            self.stackView.alpha = 0.3
        }
    }
}

extension EvolutionChainPageCell: PokemonViewDelegate {

    func didTapPokemonView(_ pokemon: Pokemon) {
        self.delegate?.cell(self, didTap: pokemon)
    }
}

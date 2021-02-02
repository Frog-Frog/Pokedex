//
//  EvolutionChainPokemonCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/01.
//

import Domain
import UIKit

protocol EvolutionChainPokemonCellDelegate: AnyObject {
    func cell(_ cell: EvolutionChainPokemonCell, didSelect pokemon: EvolutionChainModel.EvolutionChain.Pokemon)
}

final class EvolutionChainPokemonCell: UITableViewCell {

    @IBOutlet private weak var hoverView: HoverView! {
        willSet {
            newValue.delegate = self
        }
    }

    @IBOutlet private weak var spriteImageView: UIImageView!

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    private var pokemon: EvolutionChainModel.EvolutionChain.Pokemon!

    private weak var delegate: EvolutionChainPokemonCellDelegate?

    func setData(_ data: EvolutionChainModel.EvolutionChain.Pokemon, delegate: EvolutionChainPokemonCellDelegate?) {
        self.pokemon = data
        self.delegate = delegate
        self.nameLabel.text = data.name
        self.numberLabel.text = L10n.Common.number(data.number)
        self.spriteImageView.loadImage(with: data.imageUrl, placeholder: Asset.monsterball.image)
    }
}

extension EvolutionChainPokemonCell: HoverViewDelegate {

    func didTouchDown() {

    }

    func didTouchUpInside() {
        self.delegate?.cell(self, didSelect: self.pokemon)
    }
}

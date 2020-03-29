//
//  PokemonDetailPokemonTypeItemCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import Domain
import UIKit

final class PokemonDetailPokemonTypeItemCell: UICollectionViewCell {

    @IBOutlet private weak var pokemonTypeView: PokemonTypeView!

    func setData(_ type: PokemonType) {
        self.pokemonTypeView.setData(type)
    }
}

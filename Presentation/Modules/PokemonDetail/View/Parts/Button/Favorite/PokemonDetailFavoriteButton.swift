//
//  PokemonDetailFavoriteButton.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import UIKit

protocol PokemonDetailFavoriteButtonDelegate: class {
    func button(_ button: PokemonDetailFavoriteButton, didToggle isFavorite: Bool)
}

final class PokemonDetailFavoriteButton: XibLoadableView {

    @IBOutlet private weak var button: UIButton!

    weak var delegate: PokemonDetailFavoriteButtonDelegate?

    var isFavorite: Bool {
        set {
            self.button.isSelected = newValue
        }
        get {
            return self.button.isSelected
        }
    }

    @IBAction private func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.delegate?.button(self, didToggle: self.isFavorite)
    }
}

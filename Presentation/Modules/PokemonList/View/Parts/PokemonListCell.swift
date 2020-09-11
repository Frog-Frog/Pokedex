//
//  PokemonListCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Domain
import UIKit

final class PokemonListCell: UITableViewCell {

    @IBOutlet private weak var spriteImageView: UIImageView!

    @IBOutlet private weak var innerView: UIView!

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    func setData(_ data: PokemonListModel.Pokemon) {
        self.spriteImageView.loadImage(with: data.imageUrl, placeholder: Asset.monsterball.image)
        self.numberLabel.text = "No.\(data.number)"
        self.nameLabel.text = data.name
    }

    func abbreviate() {
        let x: CGFloat = UIScreen.main.bounds.width * 0.375
        self.innerView.transform = .init(translationX: x, y: 0.0)
        self.innerView.alpha = 0.3
    }

    func expand() {
        self.innerView.transform = .identity
        self.innerView.alpha = 1.0
    }
}

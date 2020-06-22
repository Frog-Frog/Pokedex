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

    @IBOutlet private weak var numberLabel: UILabel!

    @IBOutlet private weak var nameLabel: UILabel!

    func setData(_ data: PokemonListModel.Pokemon) {
        self.spriteImageView.loadImage(with: data.imageUrl, placeholder: Asset.monsterball.image)
        self.numberLabel.text = "No.\(data.number)"
        self.nameLabel.text = data.name
    }
}

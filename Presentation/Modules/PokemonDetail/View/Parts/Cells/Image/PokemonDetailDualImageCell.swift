//
//  PokemonDetailDualImageCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/20.
//

import UIKit

final class PokemonDetailDualImageCell: UITableViewCell {

    @IBOutlet private weak var frontImageView: UIImageView!
    @IBOutlet private weak var backImageView: UIImageView!

    func setData(frontImageUrl: String, backImageUrl: String) {
        self.frontImageView.loadImage(with: frontImageUrl)
        self.backImageView.loadImage(with: backImageUrl)
    }
}

//
//  PokemonDetailSingleImageCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/04.
//

import UIKit

final class PokemonDetailSingleImageCell: UITableViewCell {

    @IBOutlet private weak var frontImageView: UIImageView!

    func setData(_ frontImageUrl: String) {
        self.frontImageView.loadImage(with: frontImageUrl)
    }
}

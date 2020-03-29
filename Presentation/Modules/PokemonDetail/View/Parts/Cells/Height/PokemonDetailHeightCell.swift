//
//  PokemonDetailHeightCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/20.
//

import UIKit

final class PokemonDetailHeightCell: UITableViewCell {

    @IBOutlet private weak var heightLabel: UILabel!

    func setData(_ height: Float) {
        self.heightLabel.text = "Height: \(height)m"
    }
}

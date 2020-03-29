//
//  PokemonDetailWeightCell.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/20.
//

import UIKit

final class PokemonDetailWeightCell: UITableViewCell {

    @IBOutlet private weak var weightLabel: UILabel!

    func setData(_ weight: Float) {
        self.weightLabel.text = "Weight: \(weight)kg"
    }
}

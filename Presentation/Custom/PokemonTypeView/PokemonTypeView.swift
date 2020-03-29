//
//  PokemonTypeView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import Domain
import UIKit

final class PokemonTypeView: XibLoadableView {

    @IBOutlet private weak var backgroundView: UIView!

    @IBOutlet private weak var nameLabel: UILabel!

    func setData(_ type: PokemonType) {
        self.nameLabel.text = type.text
        self.backgroundView.backgroundColor = UIColor(hex: type.hex)
    }
}

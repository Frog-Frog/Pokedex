//
//  PokemonStatusView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/09.
//

import Domain
import UIKit

final class PokemonStatusView: XibLoadableView {

    @IBOutlet private weak var valueLabel: UILabel!

    @IBOutlet private weak var statusBarView: UIView!

    private var statusBarWidthConstraint: NSLayoutConstraint?

    func setData(_ status: PokemonStatus) {
        self.valueLabel.text = "\(status.value)"
        self.statusBarView.backgroundColor = UIColor(hex: status.type.hex)

        self.statusBarWidthConstraint?.isActive = false
        let multiplier = CGFloat(status.value) / 255
        self.statusBarWidthConstraint = self.statusBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        self.statusBarWidthConstraint?.isActive = true
    }
}

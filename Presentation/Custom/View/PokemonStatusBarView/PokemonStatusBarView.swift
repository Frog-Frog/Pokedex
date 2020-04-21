//
//  PokemonStatusView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/09.
//

import Domain
import UIKit

final class PokemonStatusBarView: XibLoadableView {

    @IBOutlet private weak var statusBarView: UIView!

    private var statusBarWidthConstraint: NSLayoutConstraint?

    func setData(_ value: Int) {
        self.statusBarWidthConstraint?.isActive = false
        let multiplier = CGFloat(value) / 255
        self.statusBarWidthConstraint = self.statusBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        self.statusBarWidthConstraint?.isActive = true
    }
}

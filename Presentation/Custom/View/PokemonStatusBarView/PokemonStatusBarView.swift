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
    private var multiplier: CGFloat = 0.0

    func setData(_ value: Int) {
        self.statusBarWidthConstraint?.isActive = false
        self.multiplier = CGFloat(value) / 255
    }

    func animate() {
        self.statusBarWidthConstraint = self.statusBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        self.statusBarWidthConstraint?.isActive = true

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

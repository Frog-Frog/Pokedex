//
//  PokemonStatusView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/09.
//

import Domain
import UIKit

final class PokemonStatusBarView: XibLoadableView {

    @IBOutlet private weak var statusBarView: UIView! {
        willSet {
            newValue.layer.anchorPoint = .init(x: 1.0, y: 0.5)
        }
    }

    private var width: CGFloat = 0.0

    func setData(_ value: Int) {
        self.width = self.bounds.width * CGFloat(value) / 255
    }

    func animate() {
        let widthAnimation                   = CABasicAnimation(keyPath: "bounds.size.width")
        widthAnimation.fromValue             = 0.0
        widthAnimation.toValue               = self.width
        widthAnimation.duration              = 0.2
        widthAnimation.timingFunction        = Easing.EaseOut.cubic.function
        widthAnimation.isRemovedOnCompletion = false
        widthAnimation.fillMode              = .forwards

        self.statusBarView.layer.add(widthAnimation, forKey: "width")
    }
}

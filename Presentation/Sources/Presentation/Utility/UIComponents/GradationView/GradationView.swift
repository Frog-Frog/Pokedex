//
//  GradationView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/09.
//

import UIKit

final class GradationView: UIView {

    @IBInspectable var topColor: UIColor = .clear
    @IBInspectable var bottomColor: UIColor = .white

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    func setGradation() {
        guard let gradientLayer = self.layer as? CAGradientLayer else {
            return
        }
        gradientLayer.colors = [self.topColor.cgColor, self.bottomColor.cgColor]
    }
}

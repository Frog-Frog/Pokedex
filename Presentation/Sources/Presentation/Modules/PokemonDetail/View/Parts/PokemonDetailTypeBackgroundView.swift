//
//  PokemonDetailTypeBackgroundView.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/12/14.
//

import Foundation
import UIKit

protocol PokemonDetailTypeBackgroundViewDelegate: AnyObject {
    func finishedTypeBackgroundViewShowAnimation()
    func finishedTypeBackgroundViewHideAnimation()
}

final class PokemonDetailTypeBackgroundView: UIView {

    weak var delegate: PokemonDetailTypeBackgroundViewDelegate?

    func setColor(_ color: UIColor) {
        self.backgroundColor = color
    }

    func show() {
        self.transform = .init(scaleX: 0.0, y: 1.0)

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.alpha = 1.0
        }, completion: nil)

        UIView.animate(withDuration: 0.2, delay: 0.05, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = .identity
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.finishedTypeBackgroundViewShowAnimation()
        })
    }

    func hide() {
        let yAnimate                   = CABasicAnimation(keyPath: "transform.translation.y")
        yAnimate.fromValue             = 0
        yAnimate.toValue               = -self.bounds.height
        yAnimate.duration              = 0.3
        yAnimate.timingFunction        = Easing.EaseOut.quad.function
        yAnimate.isRemovedOnCompletion = false
        yAnimate.fillMode              = .forwards
        yAnimate.delegate              = self

        let radiusAnimate                   = CABasicAnimation(keyPath: "cornerRadius")
        radiusAnimate.fromValue             = 0
        radiusAnimate.toValue               = self.bounds.width / 2
        radiusAnimate.duration              = 0.1
        radiusAnimate.timingFunction        = Easing.EaseOut.quad.function
        radiusAnimate.isRemovedOnCompletion = false
        radiusAnimate.fillMode              = .forwards

        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.layer.add(yAnimate, forKey: "translation.y")
        self.layer.add(radiusAnimate, forKey: "radius")

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.finishedTypeBackgroundViewHideAnimation()
        })
    }
}

// MARK: - CAAnimationDelegate
extension PokemonDetailTypeBackgroundView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.removeFromSuperview()
    }
}

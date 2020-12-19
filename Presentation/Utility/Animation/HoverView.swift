//
//  HoverView.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/09/22.
//

import Foundation
import UIKit

protocol HoverViewDelegate: class {
    func didTouchDown()
    func didTouchCancel()
    func didTouchUpInside()
    func didTouchUpInside(sender: HoverView)
}

extension HoverViewDelegate {
    func didTouchDown() {}
    func didTouchCancel() {}
    func didTouchUpInside() {}
    func didTouchUpInside(sender: HoverView) {}
}

final class HoverView: UIView {

    // defaultはalphaもscaleもアニメーション対象
    @IBInspectable var needAlphaAnimate         : Bool    = true
    @IBInspectable var needScaleAnimate         : Bool    = true
    @IBInspectable var needHighlightAnimate     : Bool    = false
    @IBInspectable var normalBackgroundColor    : UIColor = .white
    @IBInspectable var highlightBackgroundColor : UIColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1)
    var highlightAlpha                          : CGFloat = 0.6
    var smallScale                              : CGFloat = 0.9
    var bigScale                                : CGFloat = 1.3

    private var touchDown = false
    weak var delegate: HoverViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        self.isExclusiveTouch = true
    }
}

// MARK: - touch
extension HoverView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchDown = true
        self.startForwardAnimate()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !self.touchDown {
            return
        }
        if let touch = touches.first {
            let point = touch.location(in: self)
            let scale = self.smallScale <= 1.0 ? self.smallScale : 1.0
            let distanceX = abs(point.x - self.bounds.size.width / 2) * scale
            let distanceY = abs(point.y - self.bounds.size.height / 2) * scale
            if distanceX > self.bounds.size.width / 2 || distanceY > self.bounds.size.height / 2 {
                self.endForwardAnimate()
                return
            } else {
                self.startBackAnimate()
            }
            self.touchDown = false
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !self.touchDown {
            return
        }

        self.endForwardAnimate()
        self.touchDown = false
    }
}

// MARK: - animation
extension HoverView {

    private func startForwardAnimate() {
        self.delegate?.didTouchDown()

        UIView.animate(
            withDuration: 0.1,
            animations: { [weak self] in
                guard let self = self else { return }

                if self.needAlphaAnimate {
                    self.alpha = self.highlightAlpha
                }
                if self.needScaleAnimate {
                    let identity: CGAffineTransform = .identity
                    self.transform = identity.scaledBy(x: self.smallScale, y: self.smallScale)
                }
                if self.needHighlightAnimate {
                    self.backgroundColor = self.highlightBackgroundColor
                }
            })
    }

    private func endForwardAnimate() {
        self.delegate?.didTouchCancel()

        UIView.animate(
            withDuration: 0.1,
            animations: { [weak self] in
                guard let self = self else { return }

                if self.needAlphaAnimate {
                    self.alpha = 1.0
                }
                if self.needScaleAnimate {
                    self.transform = .identity
                }
                if self.needHighlightAnimate {
                    self.backgroundColor = self.normalBackgroundColor
                }
            })
    }

    private func startBackAnimate() {
        self.delegate?.didTouchUpInside()
        self.delegate?.didTouchUpInside(sender: self)

        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: .curveEaseIn,
            animations: { [weak self] in
                guard let self = self else { return }

                if self.needAlphaAnimate {
                    self.alpha = 1.0
                }
                if self.needScaleAnimate {
                    let identity: CGAffineTransform = .identity
                    self.transform = identity.scaledBy(x: self.bigScale, y: self.bigScale)
                }
                if self.needHighlightAnimate {
                    self.backgroundColor = self.normalBackgroundColor
                }
            },  completion: { _ in
                UIView.animate(
                    withDuration: 0.2,
                    delay: 0,
                    options: .curveEaseInOut,
                    animations: { [weak self] in
                        guard let self = self else { return }

                        if self.needScaleAnimate {
                            self.transform = .identity
                        }
                    },  completion: nil)
            })
    }
}

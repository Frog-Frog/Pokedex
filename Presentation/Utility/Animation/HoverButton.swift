//
//  HoverButton.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/09/28.
//

import Foundation
import UIKit

protocol HoverButtonDelegate: class {
    func didTouchDown()
    func didTouchUpInside()
    func didTouchUpInside(sender: HoverButton)
}

extension HoverButtonDelegate {
    func didTouchDown() {}
    func didTouchUpInside() {}
    func didTouchUpInside(sender: HoverButton) {}
}

final class HoverButton: UIButton {

    // defaultはalphaもscaleもアニメーション対象
    @IBInspectable var needAlphaAnimate         : Bool    = true
    @IBInspectable var needScaleAnimate         : Bool    = true
    @IBInspectable var needHighlightAnimate     : Bool    = false
    @IBInspectable var normalBackgroundColor    : UIColor = .white
    @IBInspectable var highlightBackgroundColor : UIColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1)

    weak var delegate: HoverButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        self.adjustsImageWhenHighlighted = false
        self.addTarget(self, action: #selector(self.didTouchDown)        , for: .touchDown)
        self.addTarget(self, action: #selector(self.didTouchDragOutside) , for: .touchDragOutside)
        self.addTarget(self, action: #selector(self.didTouchDragOutside) , for: .touchCancel)
        self.addTarget(self, action: #selector(self.didTouchDown)        , for: .touchDragEnter)
        self.addTarget(self, action: #selector(self.didTouchUpInside)    , for: .touchUpInside)

        self.isExclusiveTouch = true
    }
}

// MARK: events
extension HoverButton {

    @objc
    private func didTouchDown() {
        self.delegate?.didTouchDown()

        UIView.animate(
            withDuration: 0.1,
            animations: { [weak self] in
                guard let self = self else { return }

                if self.needAlphaAnimate {
                    self.alpha = 0.6
                }
                if self.needScaleAnimate {
                    self.transform = self.transform.scaledBy(x: 0.9, y: 0.9)
                }
                if self.needHighlightAnimate {
                    self.backgroundColor = self.highlightBackgroundColor
                }
            })
    }

    @objc
    private func didTouchDragOutside() {
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

    @objc
    private func didTouchUpInside() {
        self.delegate?.didTouchUpInside()
        self.delegate?.didTouchUpInside(sender: self)

        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: .curveEaseIn,
            animations: { [weak self] in
                guard let self = self else { return }

                if self.needAlphaAnimate {
                    self.alpha     = 1.0
                }
                if self.needScaleAnimate {
                    self.transform = self.transform.scaledBy(x: 1.3, y: 1.3)
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

                        self.transform = .identity
                    },  completion: nil)
            })
    }
}

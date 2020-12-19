//
//  AnimateNumberLabel.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/12/11.
//

import Foundation
import UIKit

final class AnimateNumberLabel: UILabel {

    private var loop: CADisplayLink?
    private var startTime: TimeInterval = 0.0
    private var currentValue = 0
    private var newValue = 0

    func setData(value: Int, animated: Bool = false) {
        self.newValue = value
        if animated && self.currentValue != self.newValue {
            self.animateValue()
        } else {
            self.currentValue = value
            self.text = value.description
        }
    }

    private func animateValue() {
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.loop = CADisplayLink(target: self, selector: #selector(self.update))
        self.loop?.preferredFramesPerSecond = 60
        self.loop?.add(to: .current, forMode: .common)
        self.loop?.isPaused = false
    }

    @objc
    private func update(displayLink: CADisplayLink) {
        let duration: TimeInterval = 0.2
        let elapsed: TimeInterval = Date.timeIntervalSinceReferenceDate - self.startTime

        let value: Int = {
            // easeOutだと最後の最後に数値が切り替わってちょっと汚いのでendValueに3%足した値でprogressを算出する
            let value = Int(Easing.EaseOut.cubic.getProgress(elapsed: elapsed, duration: duration, startValue: CGFloat(self.currentValue), endValue: CGFloat(self.newValue) * 1.03))
            // newValueを超えないように
            return min(value, self.newValue)
        }()

        self.text = value.description

        if duration < elapsed {
            self.loop?.isPaused = true
            self.loop?.invalidate()
            self.loop = nil
            self.currentValue = self.newValue
        }
    }
}

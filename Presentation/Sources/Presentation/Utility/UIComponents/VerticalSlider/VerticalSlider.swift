//
//  VerticalSlider.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/09.
//

import UIKit

final class VerticalSlider: UISlider {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.frame = self.superview!.bounds
    }
}

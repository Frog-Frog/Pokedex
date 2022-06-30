//
//  UIStackView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/10.
//

import UIKit

extension UIStackView {

    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}

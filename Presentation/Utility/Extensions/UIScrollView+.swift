//
//  UIScrollView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/18.
//

import UIKit

extension UIScrollView {

    var currentPage: Int {
        return Int(self.contentOffset.x / self.frame.size.width)
    }
}

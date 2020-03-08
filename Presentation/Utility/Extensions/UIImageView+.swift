//
//  UIImageView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import Nuke
import UIKit

extension UIImageView {
    
    func loadImage(with urlString: String) {
        Nuke.loadImage(with: URL(string: urlString)!, into: self)
    }
}

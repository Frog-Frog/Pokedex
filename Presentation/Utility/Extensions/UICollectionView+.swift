//
//  UICollectionView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        self.register(cellType.nib, forCellWithReuseIdentifier: cellType.className)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }
}

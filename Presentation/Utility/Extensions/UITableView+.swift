//
//  UITableView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType.nib, forCellReuseIdentifier: cellType.className)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
}

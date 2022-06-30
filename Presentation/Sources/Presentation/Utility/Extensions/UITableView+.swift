//
//  UITableView+.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/08.
//

import UIKit

extension UITableView {

    func reloadData(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0) {
            self.reloadData()
        } completion: { _ in
            completion?()
        }
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType.nib, forCellReuseIdentifier: cellType.className)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }

    func deselectAllRows(animated: Bool) {
        guard let indexPaths = self.indexPathsForSelectedRows else {
            return
        }
        indexPaths.forEach { self.deselectRow(at: $0, animated: animated) }
    }
}

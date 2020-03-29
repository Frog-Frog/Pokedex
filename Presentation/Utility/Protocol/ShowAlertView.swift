//
//  ShowAlertView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import UIKit

protocol ShowAlertView: class {

    func showAlert(_ title: String,
                   message: String,
                   actions: [UIAlertAction])
}

extension ShowAlertView where Self: UIViewController {

    func showAlert(_ title: String,
                   message: String,
                   actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        self.present(alert, animated: true, completion: nil)
    }
}

//
//  ShowErrorAlertView.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import Foundation

protocol ShowErrorAlertView: ShowAlertView {

    func showErrorAlert(_ error: Error)
}

extension ShowErrorAlertView {

    func showErrorAlert(_ error: Error) {
        self.showAlert("Error", message: error.localizedDescription, actions: [
            .init(title: "Close", style: .default, handler: nil)
        ])
    }
}

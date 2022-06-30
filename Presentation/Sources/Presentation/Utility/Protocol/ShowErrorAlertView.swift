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
        self.showAlert(L10n.Alert.Title.error, message: error.localizedDescription, actions: [
            .init(title: L10n.Alert.Button.close, style: .default, handler: nil)
        ])
    }
}

//
//  ItemDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol ItemDetailView: ShowErrorAlertView {
    func showItemDetailModel(_ model: ItemDetailModel)
}

// MARK: - Properties
final class ItemDetailViewController: UIViewController {

    var presenter: ItemDetailPresenter!
}

// MARK: - Life cycle
extension ItemDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - ItemDetailView
extension ItemDetailViewController: ItemDetailView {

    func showItemDetailModel(_ model: ItemDetailModel) {
    }
}

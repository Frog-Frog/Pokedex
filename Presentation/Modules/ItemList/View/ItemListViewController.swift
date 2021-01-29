//
//  ItemListViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol ItemListView: AnyObject {}

// MARK: - Properties
final class ItemListViewController: UIViewController {

    var presenter: ItemListPresenter!
}

// MARK: - Life cycle
extension ItemListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ItemListView
extension ItemListViewController: ItemListView {
}

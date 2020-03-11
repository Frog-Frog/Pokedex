//
//  PokeonDetailViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 11/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol PokeonDetailView: class {}

// MARK: - vars and life cycle
final class PokeonDetailViewController: UIViewController {

    var presenter: PokeonDetailPresenter!
}

// MARK: - Life cycle
extension PokeonDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - PokeonDetailView
extension PokeonDetailViewController: PokeonDetailView {
}

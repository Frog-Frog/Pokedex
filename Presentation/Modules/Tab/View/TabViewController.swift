//
//  TabViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TabView: class {}

// MARK: - vars and life cycle
final class TabViewController: UITabBarController {

    var presenter: TabPresenter!
}

// MARK: - Life cycle
extension TabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TabView
extension TabViewController: TabView {
}
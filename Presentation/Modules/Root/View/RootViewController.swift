//
//  RootViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol RootView: AnyObject {}

// MARK: - Properties
final class RootViewController: UITabBarController {

    var presenter: RootPresenter!
}

// MARK: - Life cycle
extension RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.delegate = self
        self.setViewControllers(Tab.allCases.map { PokedexNavigationController(rootViewController: $0.viewController) }, animated: false)
    }
}

// MARK: - RootView
extension RootViewController: RootView {
}

extension RootViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
}

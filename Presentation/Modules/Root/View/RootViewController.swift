//
//  RootViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol RootView: AnyObject {}

// MARK: - Properties
public final class RootViewController: UITabBarController {

    var presenter: RootPresenter!
}

// MARK: - Life cycle
extension RootViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.setViewControllers(Tab.allCases.map { PokedexNavigationController(rootViewController: $0.viewController) }, animated: false)
    }
}

// MARK: - RootView
extension RootViewController: RootView {
}

// MARK: - URL Scheme
extension RootViewController: UrlSchemeWireframe {

    var viewController: UIViewController? {
        return self.viewControllers?[self.selectedIndex]
    }

    public func execute(_ urlScheme: UrlScheme?) {
        self.transit(by: urlScheme)
    }
}

//
//  RootViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Domain
import UIKit

protocol RootView: AnyObject {
    func showTab(_ tab: PokedexTab)
}

// MARK: - Properties
public final class RootViewController: UIViewController {

    var presenter: RootPresenter!

    private var viewControllers = PokedexTab.allCases.map { PokedexNavigationController(rootViewController: $0.viewController) }

    private lazy var itemViews: [RootTabItemView] = PokedexTab.allCases.map {
        let view = RootTabItemView()
        view.setTab($0, delegate: self)
        return view
    }

    private var selectedIndex = 0

    @IBOutlet private weak var stackView: UIStackView!

    @IBOutlet private weak var containerView: UIView!
}

// MARK: - Life cycle
extension RootViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.setupTab()
        self.setViewController(self.selectedIndex)
    }

    private func setupTab() {
        self.itemViews.enumerated().forEach {
            self.stackView.addArrangedSubview($0.element)
            $0.element.isSelected = $0.offset == self.selectedIndex
        }
    }

    private func setViewController(_ index: Int) {
        self.viewControllers[self.selectedIndex].viewControllers.last?.dismiss(animated: false, completion: nil)

        self.selectedIndex = index

        self.itemViews.enumerated().forEach { $0.element.isSelected = index == $0.offset }

        let viewController = self.viewControllers[self.selectedIndex]
        self.containerView.subviews.forEach { $0.removeFromSuperview() }
        self.addChild(viewController)
        self.containerView.addSubview(viewController.view)
        self.containerView.fitToSelf(childView: viewController.view)
        viewController.didMove(toParent: self)
    }
}

// MARK: - RootView
extension RootViewController: RootView {

    func showTab(_ tab: PokedexTab) {
        self.setViewController(tab.rawValue)
    }
}

extension RootViewController: RootTabItemViewDelegate {

    func didSelect(_ tab: PokedexTab) {
        self.setViewController(tab.rawValue)
    }
}

// MARK: - URL Scheme
extension RootViewController: UrlSchemeWireframe {

    var viewController: UIViewController? {
        return self.viewControllers[self.selectedIndex].viewControllers.last
    }

    public func execute(_ urlScheme: UrlScheme?) {
        self.transit(by: urlScheme)
    }
}

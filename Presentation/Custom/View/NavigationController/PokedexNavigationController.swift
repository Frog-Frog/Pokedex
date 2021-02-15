//
//  PokedexNavigationController.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import Domain
import UIKit

// Pokedex独自で使用する共通UINavigationController
// 初期化すると自動で見た目を設定する
final class PokedexNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setup()
    }

    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.setup()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}

// MARK: - Setup
extension PokedexNavigationController {

    private func setup() {
        self.interactivePopGestureRecognizer?.delegate = nil
        self.setNavigationBarHidden(true, animated: false)
    }
}

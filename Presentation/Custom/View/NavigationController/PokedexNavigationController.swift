//
//  PokedexNavigationController.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/03/28.
//

import UIKit

// Pokedex独自で使用する共通UINavigationController
// 初期化すると自動で見た目を設定する
public final class PokedexNavigationController: UINavigationController {

    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setup()
    }

    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.setup()
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
}

extension PokedexNavigationController {

    private func setup() {
        self.interactivePopGestureRecognizer?.delegate = nil
        self.setupAppearance()
    }

    private func setupAppearance() {
        // バーの背景色
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false

        // 下線消す
        self.navigationBar.shadowImage = UIImage()

        // バーの影
        self.navigationBar.shadowColor = Asset.shadow.color
        self.navigationBar.shadowRadius = 16
        self.navigationBar.shadowOffset = CGSize(width: 0, height: 4)
        self.navigationBar.shadowOpacity = 1
        self.navigationBar.layer.masksToBounds = false
    }
}

extension PokedexNavigationController: UrlSchemeWireframe {

    public func execute(_ urlScheme: UrlScheme?) {
        self.transit(by: urlScheme)
    }

    var viewController: UIViewController? {
        return self.viewControllers.last
    }
}

//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Presentation
import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        self.setupWindow(scene)
    }

    private func setupWindow(_ scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        let navigationController = PokedexNavigationController(rootViewController: PokemonListBuilder.build())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

@available(iOS 13.0, *)
extension SceneDelegate {

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        let urlScheme = UrlScheme(url)
        let navigationController = self.window?.rootViewController as? PokedexNavigationController
        navigationController?.execute(urlScheme)
    }
}

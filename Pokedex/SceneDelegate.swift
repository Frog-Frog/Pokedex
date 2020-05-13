//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Domain
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

        if let userActivity = connectionOptions.userActivities.first {
            self.execute(userActivity)
        }
    }
}

// MARK: - Setup Window
@available(iOS 13.0, *)
extension SceneDelegate {

    private func setupWindow(_ scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        let navigationController = PokedexNavigationController(rootViewController: PokemonListBuilder.build())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

// MARK: - URL Scheme
@available(iOS 13.0, *)
extension SceneDelegate {

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        let urlScheme = UrlScheme(url)
        self.execute(urlScheme)
    }

    private func execute(_ urlScheme: UrlScheme?) {
        let navigationController = self.window?.rootViewController as? PokedexNavigationController
        navigationController?.execute(urlScheme)
    }
}

// MARK: - Open from NSUserAcitivity(e.g. Universal Links, Spotlight, Siri Shortcut and others.)
@available(iOS 13.0, *)
extension SceneDelegate {

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        self.execute(userActivity)
    }

    private func execute(_ userActivity: NSUserActivity) {
        switch PokedexActivity(userActivity) {
        case .spotlight(let urlScheme):
            self.execute(urlScheme)
        case .none:
            return
        }
    }
}

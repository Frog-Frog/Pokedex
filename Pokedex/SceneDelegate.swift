//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Domain
import Presentation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        self.setupWindow(scene)

        // Launch from NSUserActivity(e.g. Universal Links, Spotlight, Siri Shortcut and others.)
        if let userActivity = connectionOptions.userActivities.first {
            self.execute(userActivity)
        }

        // Launch from TodayExtension
        if let url = connectionOptions.urlContexts.first?.url {
            self.execute(UrlScheme(url))
        }
    }
}

// MARK: - Setup Window
extension SceneDelegate {

    private func setupWindow(_ scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        self.window?.rootViewController = RootBuilder.build()
        self.window?.makeKeyAndVisible()
    }
}

// MARK: - URL Scheme
extension SceneDelegate {

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        let urlScheme = UrlScheme(url)
        self.execute(urlScheme)
    }

    private func execute(_ urlScheme: UrlScheme?) {
        let rootViewController = self.window?.rootViewController as? RootViewController
        rootViewController?.execute(urlScheme)
    }
}

// MARK: - Open from NSUserAcitivity(e.g. Universal Links, Spotlight, Siri Shortcut and others.)
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

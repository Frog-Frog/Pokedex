//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/02/16.
//  Copyright © 2020 TomosukeOkada. All rights reserved.
//

import Presentation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    @available(iOS, deprecated: 13.0)
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.setupWindowIfNeeded()
        return true
    }
}

// MARK: - Setup Window
extension AppDelegate {

    private func setupWindowIfNeeded() {
        if #available(iOS 13.0, *) {
        } else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = PokedexNavigationController(rootViewController: PokemonListBuilder.build())
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
}

// MARK: - URL Scheme
extension AppDelegate {

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlScheme = UrlScheme(url)
        self.execute(urlScheme)
        return true
    }

    private func execute(_ urlScheme: UrlScheme?) {
        let navigationController = self.window?.rootViewController as? PokedexNavigationController
        navigationController?.execute(urlScheme)
    }
}

// MARK: - Open from NSUserAcitivity(e.g. Universal Links, Spotlight, Siri Shortcut and others.)
extension AppDelegate {

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        switch PokedexActivity(userActivity) {
        case .spotlight(let urlScheme):
            self.execute(urlScheme)
            return true
        case .none:
            return false
        }
    }
}

// MARK: - Scene Lifecycle
@available(iOS 13.0, *)
extension AppDelegate {

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

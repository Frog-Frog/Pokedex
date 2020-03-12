//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/02/16.
//  Copyright © 2020 TomosukeOkada. All rights reserved.
//

import Presentation
import RealmSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    @available(iOS, deprecated: 13.0)
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.setupWindowIfNeeded()
        self.setupLibiraries()
        return true
    }
}

// MARK: - Setup Window
extension AppDelegate {

    private func setupWindowIfNeeded() {
        if #available(iOS 13.0, *) {
        }
        else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = UINavigationController(rootViewController: PokemonListBuilder.build())
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
}

// MARK: - Setup Libraries
extension AppDelegate {

    private func setupLibiraries() {
        self.setupRealm()
    }

    private func setupRealm() {
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
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

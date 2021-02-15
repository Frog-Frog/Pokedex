//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/02/16.
//  Copyright © 2020 TomosukeOkada. All rights reserved.
//

import Domain
import Firebase
import Presentation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    @available(iOS, deprecated: 13.0)
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.setupFirebase()
        return true
    }
}

// MARK: - Firebase
extension AppDelegate {

    private func setupFirebase() {
        FirebaseApp.configure()
    }
}

// MARK: - Scene Lifecycle
extension AppDelegate {

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

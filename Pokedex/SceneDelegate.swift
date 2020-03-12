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
        let navigationController = UINavigationController(rootViewController: PokemonListBuilder.build())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

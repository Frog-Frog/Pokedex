//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/02/16.
//  Copyright © 2020 TomosukeOkada. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UIViewController()
        vc.present(vc, animated: true, completion: nil)
        return true
    }
}


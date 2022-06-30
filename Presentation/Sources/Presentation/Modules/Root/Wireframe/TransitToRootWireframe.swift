//
//  TransitToRootWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToRootWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func showTab(_ tab: PokedexTab)
}

extension TransitToRootWireframe {

    func showTab(_ tab: PokedexTab) {
        NotificationCenter.default.post(name: Notification.Name.Pokedex.tabChange, object: tab)
    }
}

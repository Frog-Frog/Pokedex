//
//  TabBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

enum TabBuilder {

    static func build() -> UIViewController {
        let view = TabViewController.instantiate()
        let presenter = TabPresenterImpl()
        let wireframe = TabWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

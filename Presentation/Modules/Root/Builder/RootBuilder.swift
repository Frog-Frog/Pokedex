//
//  RootBuilder.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

enum RootBuilder {

    static func build() -> UIViewController {
        let view = RootViewController.instantiate()
        let presenter = RootPresenterImpl()
        let wireframe = RootWireframeImpl()

        view.presenter = presenter

        presenter.view = view
        presenter.wireframe = wireframe

        wireframe.viewController = view

        return view
    }
}

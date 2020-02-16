//
//  TabPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

protocol TabPresenter {}

final class TabPresenterImpl: TabPresenter {

    weak var view: TabView?
    var wireframe: TabWireframe!
}

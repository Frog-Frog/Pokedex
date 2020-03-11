//
//  PokeonDetailPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 11/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import Foundation

protocol PokeonDetailPresenter: class {}

final class PokeonDetailPresenterImpl: PokeonDetailPresenter {

    weak var view: PokeonDetailView?
    var wireframe: PokeonDetailWireframe!
}

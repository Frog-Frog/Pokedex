//
//  PokeonDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 11/03/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol PokeonDetailWireframe: class {}

final class PokeonDetailWireframeImpl: PokeonDetailWireframe {

    weak var viewController: UIViewController?
}

//
//  ItemListWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

/// @mockable
protocol ItemListWireframe: TransitToItemDetailWireframe {}

final class ItemListWireframeImpl: ItemListWireframe {

    weak var viewController: UIViewController?
}

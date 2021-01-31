//
//  ItemDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol ItemDetailWireframe: AnyObject {}

final class ItemDetailWireframeImpl: ItemDetailWireframe {

    weak var viewController: UIViewController?
}

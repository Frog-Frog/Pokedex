//
//  TabWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TabWireframe {}

final class TabWireframeImpl: TabWireframe {

    weak var viewController: UIViewController?
}

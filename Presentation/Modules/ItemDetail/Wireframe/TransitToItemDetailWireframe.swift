//
//  TransitToItemDetailWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToItemDetailWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func pushItemDetail(number: Int)
}

extension TransitToItemDetailWireframe {

    func pushItemDetail(number: Int) {
        let vc = ItemDetailBuilder.build(number: number)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

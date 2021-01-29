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

    func pushItemDetail()
}

extension TransitToItemDetailWireframe {

    func pushItemDetail() {
        let vc = ItemDetailBuilder.build()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

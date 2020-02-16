//
//  TransitToTabWireframe.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 16/02/2020.
//  Copyright © 2020 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol TransitToTabWireframe {

    var viewController: UIViewController { get }

    // func pushTab()
    // func presentTab()
}

extension TransitToTabWireframe {

    //func pushTab() {
    //    let vc = TabBuilder.build()
    //    self.viewController?.navigationController?.pushViewController(vc, animated: true)
    //}

    //func presentTab() {
    //    let vc = TabBuilder.build()
    //    self.viewController?.present(vc, animated: true, completion: nil)
    //}
}

//protocol TabWireframeDelegate: class {}

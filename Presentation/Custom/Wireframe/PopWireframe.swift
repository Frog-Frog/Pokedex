//
//  PopWireframe.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/04/18.
//

import UIKit

protocol PopWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func pop()
}

extension PopWireframe {

    func pop() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}

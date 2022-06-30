//
//  DismissWireframe.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import UIKit

protocol DismissWireframe: AnyObject {

    var viewController: UIViewController? { get }

    func dismiss()
    func dismiss(animated: Bool)
    func dismiss(completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension DismissWireframe {

    func dismiss() {
        self.dismiss(animated: true)
    }

    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }

    func dismiss(completion: (() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        self.viewController?.dismiss(animated: animated, completion: completion)
    }
}

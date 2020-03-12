//
//  StoryBoardInstantiate.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import UIKit

extension UIViewController: StoryBoardInstantiate {}

protocol StoryBoardInstantiate {
    static func instantiate() -> Self
}

extension StoryBoardInstantiate where Self: UIViewController {

    static func instantiate() -> Self {
        let bundle = Bundle(for: self.self)
        let name = String(describing: self.self)

        guard let vc = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController.instantiate() failed: \(name)")
        }

        return vc
    }
}

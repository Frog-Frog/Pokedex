//
//  EvolutionChainViewController.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 31/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import UIKit

protocol EvolutionChainView: AnyObject {}

// MARK: - Properties
final class EvolutionChainViewController: UIViewController {

    var presenter: EvolutionChainPresenter!
}

// MARK: - Life cycle
extension EvolutionChainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - EvolutionChainView
extension EvolutionChainViewController: EvolutionChainView {
}

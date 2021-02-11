//
//  RootPresenter.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 29/01/2021.
//  Copyright © 2021 Tomosuke Okada. All rights reserved.
//

import Foundation

protocol RootPresenter: AnyObject {
    func viewDidLoad()
}

final class RootPresenterImpl: RootPresenter {

    weak var view: RootView?
    var wireframe: RootWireframe!

    func viewDidLoad() {
        self.registerNotification()
    }

    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveTabChangeNotification(_:)), name: Notification.Name.Pokedex.tabChange, object: nil)
    }
}

extension RootPresenterImpl {

    @objc
    private func didReceiveTabChangeNotification(_ sender: Notification) {
        guard let tab = sender.object as? PokedexTab else {
            return
        }
        self.view?.showTab(tab)
    }
}

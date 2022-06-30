//
//  PokedexNotificationName.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2021/02/11.
//

import Foundation

extension Notification.Name {

    enum Pokedex {

        static var tabChange: Notification.Name {
            return Notification.Name("tab_change")
        }
    }
}

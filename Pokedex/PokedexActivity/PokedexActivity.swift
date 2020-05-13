//
//  PokedexActivity.swift
//  Pokedex
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import CoreSpotlight
import Domain
import Foundation

enum PokedexActivity {
    case spotlight(UrlScheme?)

    init?(_ userActivity: NSUserActivity) {
        switch userActivity.activityType {
        case CSSearchableItemActionType:
            guard let identifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String else {
                return nil
            }
            self = .spotlight(UrlScheme(identifier))
        default:
            return nil
        }
    }
}

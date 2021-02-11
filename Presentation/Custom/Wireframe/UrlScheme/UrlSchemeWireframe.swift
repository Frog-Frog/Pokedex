//
//  UrlSchemeWireframe.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import Domain
import UIKit

protocol UrlSchemeWireframe: TransitToRootWireframe, TransitToPokemonDetailWireframe, TransitToItemDetailWireframe {

    func transit(by urlScheme: UrlScheme?)
}

extension UrlSchemeWireframe {

    func transit(by urlScheme: UrlScheme?) {
        switch urlScheme?.action {
        case .open(let type):
            switch type {
            case .pokemonDetail(let number):
                self.showTab(.pokemon)
                self.pushPokemonDetail(number: number)
            case .itemDetail(let number):
                self.showTab(.item)
                self.pushItemDetail(number: number)
            case .none:
                return
            }
        case .none:
            return
        }
    }
}

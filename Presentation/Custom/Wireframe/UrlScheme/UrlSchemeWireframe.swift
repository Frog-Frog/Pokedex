//
//  UrlSchemeWireframe.swift
//  Presentation
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import UIKit

protocol UrlSchemeWireframe: TransitToPokemonDetailWireframe {

    func transit(by urlScheme: UrlScheme?)
}

extension UrlSchemeWireframe {

    func transit(by urlScheme: UrlScheme?) {
        switch urlScheme?.action {
        case .open(let type):
            switch type {
            case .pokemonDetail(let number):
                self.pushPokemonDetail(number: number)
            case .none:
                return
            }
        case .none:
            return
        }
    }
}

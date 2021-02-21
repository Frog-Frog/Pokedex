//
//  Item.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore
@testable import Domain

extension Item {

    static var stub: Self {
        return .init(.stub)
    }
}

private extension NamedURLResource {

    static var stub: Self {
        return .init(name: "master-ball", url: "https://pokeapi.co/api/v2/item/1/")
    }
}

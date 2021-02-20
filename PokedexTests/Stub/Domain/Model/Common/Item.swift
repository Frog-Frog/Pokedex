//
//  Item.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import DataStore
@testable import Domain

extension Item {

    static var stub: Self {
        return .init(.itemStub)
    }
}

extension Array where Element == Item {

    static var stub: Self {
        return [NamedURLResource].itemStub.map { Item($0) }
    }
}

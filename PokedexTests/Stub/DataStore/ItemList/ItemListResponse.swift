//
//  ItemListResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore

extension ItemListResponse {

    static var stub: Self {
        return .init(count: 3,
                     previous: nil,
                     next: "https://pokeapi.co/api/v2/item?offset=3&limit=3",
                     results: [NamedURLResource].itemStub)
    }
}

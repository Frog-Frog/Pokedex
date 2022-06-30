//
//  ItemDetailAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

struct ItemDetailAPIRequest: PokeAPIRequestable {

    let path: String

    init(number: Int) {
        self.path = "item/\(number)"
    }
}

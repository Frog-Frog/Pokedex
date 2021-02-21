//
//  ItemListModel.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import DataStore
@testable import Domain

extension ItemListModel {

    static var stub: Self {
        return .init(.stub)
    }
}

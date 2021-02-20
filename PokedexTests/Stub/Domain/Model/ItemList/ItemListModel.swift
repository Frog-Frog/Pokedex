//
//  ItemListModel.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import Domain

extension ItemListModel {

    static var stub: Self {
        return .init(count: 3, items: [Item].stub)
    }
}

//
//  ItemListModel.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

// MARK: - ItemListModel
public struct ItemListModel {

    public let count: Int
    public let items: [Item]

    init(_ response: ItemListResponse) {
        self.count = response.count
        self.items = response.results.map { Item($0) }
    }
}

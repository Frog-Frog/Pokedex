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
    public let Items: [Item]
}

extension ItemListModel {

    init(_ response: ItemListResponse) {
        self.count = response.count
        self.Items = response.results.map { Item($0) }
    }
}

// MARK: - Item
extension ItemListModel {

    public struct Item {

        public let name: String
        public let number: Int
        public let imageUrl: URL?
    }
}

extension ItemListModel.Item {

    init(_ result: ItemListResponse.Result) {
        self.name = result.name.capitalizingFirstLetter()
        self.number = ItemNumberGenerator.generate(from: result.url)
        self.imageUrl = ItemImageURLGenerator.generateThumbnailURL(from: self.name)
    }
}

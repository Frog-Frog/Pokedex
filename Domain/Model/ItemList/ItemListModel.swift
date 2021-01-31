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
}

extension ItemListModel {

    init(_ response: ItemListResponse) {
        self.count = response.count
        self.items = response.results.map { Item($0) }
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

    init(_ resource: NamedURLResource) {
        self.name = resource.name.capitalizingFirstLetter()
        self.number = ItemNumberGenerator.generate(from: resource.url)
        self.imageUrl = ItemImageURLGenerator.generateThumbnailURL(from: resource.name)
    }
}

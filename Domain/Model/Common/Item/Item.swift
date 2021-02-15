//
//  Item.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/02/11.
//

import DataStore
import Foundation

// MARK: - Item
public struct Item {

    public let name: String

    public let number: Int

    public let imageUrl: URL?

    init(_ resource: NamedURLResource) {
        self.name = resource.name.capitalizingFirstLetter()
        self.number = ItemNumberGenerator.generate(from: resource.url)
        self.imageUrl = ItemImageURLGenerator.generateThumbnailURL(from: resource.name)
    }
}

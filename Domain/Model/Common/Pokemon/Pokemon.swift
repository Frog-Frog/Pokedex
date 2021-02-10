//
//  Pokemon.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/02/10.
//

import DataStore
import Foundation

public struct Pokemon {

    public let name: String

    public let number: Int

    public let imageUrl: URL?

    init(_ resource: NamedURLResource) {
        self.name = resource.name.capitalizingFirstLetter()
        self.number = PokemonNumberGenerator.generate(from: resource.url)
        self.imageUrl = PokemonImageURLGenerator.generateThumbnailURL(from: self.number)
    }
}

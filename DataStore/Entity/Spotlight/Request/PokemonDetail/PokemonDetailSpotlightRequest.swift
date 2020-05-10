//
//  PokemonDetailSpotlightRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/05/11.
//

import Foundation

struct PokemonDetailSpotlightRequest: SpotlightRequestable {

    var title: String

    var imageData: Data

    var description: String = ""

    var keywords: [String] = []

    var urlScheme: String

    init (number: Int, name: String, imageData: Data) {
        self.title = name
        self.imageData = imageData
        self.urlScheme = "pokedex://open/pokemon_detail?number=\(number)"
    }
}

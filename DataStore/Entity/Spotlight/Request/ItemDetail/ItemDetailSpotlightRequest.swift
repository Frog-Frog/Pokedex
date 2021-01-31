//
//  ItemDetailSpotlightRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

struct ItemDetailSpotlightRequest: SpotlightRequestable {

    var title: String

    var imageData: Data

    var description: String = ""

    var keywords: [String] = []

    var urlScheme: String

    init (number: Int, name: String, imageData: Data) {
        self.title = name
        self.imageData = imageData
        self.urlScheme = "pokedex://open/item_detail?number=\(number)"
    }
}

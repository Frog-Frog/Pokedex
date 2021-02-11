//
//  ItemDetailModel.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

public struct ItemDetailModel {

    public let number: Int

    public let name: String

    public let imageUrl: URL

    public let flavorText: String

    public let informations: [Information]

    init(_ response: ItemDetailResponse) {
        self.number = response.id
        self.name = response.name.capitalizingFirstLetter()
        self.imageUrl = URL(string: response.sprites.default)!
        let originalText = response.flavorTextEntries.first { $0.language.name == "en" }?.text ?? ""
        self.flavorText = originalText.replacingOccurrences(of: "\n", with: " ")
        let costText = response.cost == 0 ? "Not for sale" : "\(response.cost)"
        self.informations = [
            .attributes(response.attributes.first?.name.capitalizingFirstLetter() ?? "None"),
            .category(response.category.name.capitalizingFirstLetter()),
            .cost(costText)
        ]
    }
}

extension ItemDetailModel {

    public enum Information {
        case attributes(String)
        case category(String)
        case cost(String)
    }
}

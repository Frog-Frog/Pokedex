//
//  ItemImageURLGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public enum ItemImageURLGenerator {

    public static func generateThumbnailURL(from name: String) -> URL? {
        let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/\(name).png"
        return URL(string: imageUrl)
    }
}

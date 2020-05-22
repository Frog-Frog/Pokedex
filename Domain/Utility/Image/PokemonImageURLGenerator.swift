//
//  PokemonImageURLGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import Foundation

public enum PokemonImageURLGenerator {

    public static func generateThumbnailURL(from id: Int) -> URL? {
        // 3桁0埋め文字列生成
        let formatId = String(format: "%03d", id)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/thumbnails/\(formatId).png"
        return URL(string: imageUrl)
    }

    static func generateImageURL(from id: Int) -> URL? {
        // 3桁0埋め文字列生成
        let formatId = String(format: "%03d", id)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/\(formatId).png"
        return URL(string: imageUrl)
    }
}

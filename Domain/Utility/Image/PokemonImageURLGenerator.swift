//
//  PokemonImageURLGenerator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import Foundation

enum PokemonImageURLGenerator {

    static func generate(from id: Int) -> String {
        // 3桁0埋め文字列生成
        let formatId = String(format: "%03d", id)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/\(formatId).png"
        return imageUrl
    }
}

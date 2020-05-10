//
//  PokemonListAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

struct PokemonListAPIRequest: PokeAPIRequestable {

    var path: String {
        return "pokemon"
    }

    let offset: Int = 0
    // ページネーション実装するの面倒なので全件取得
    let limit: Int = 807
}

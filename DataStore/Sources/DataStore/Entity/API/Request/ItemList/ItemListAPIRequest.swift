//
//  ItemListAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

struct ItemListAPIRequest: PokeAPIRequestable {

    var path: String  = "item"

    let offset: Int = 0

    // ページネーション実装するの面倒なので全件取得
    let limit: Int = 954
}

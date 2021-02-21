//
//  ItemDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

import DataStore

extension ItemDetailResponse {

    static var stub: Self {
        return JsonParser.parseJson("ItemDetail-Masterball")
    }
}

//
//  ItemDetailTranslator.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

enum ItemDetailTranslatorProvider {

    static func provide() -> ItemDetailTranslator {
        return ItemDetailTranslatorImpl()
    }
}

/// @mockable
protocol ItemDetailTranslator {
    func convert(from response: ItemDetailResponse) -> ItemDetailModel
}

struct ItemDetailTranslatorImpl: ItemDetailTranslator {

    func convert(from response: ItemDetailResponse) -> ItemDetailModel {
        return ItemDetailModel(response)
    }
}

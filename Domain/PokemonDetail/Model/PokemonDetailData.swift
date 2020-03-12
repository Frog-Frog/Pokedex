//
//  PokemonDetailData.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

public struct PokemonDetailData {

    public let number: Int

    public let name: String

    init(_ response: PokemonDetailResponse) {
        self.number = response.id
        self.name = response.name
    }
}

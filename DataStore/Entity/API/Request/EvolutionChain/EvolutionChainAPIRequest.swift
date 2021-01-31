//
//  EvolutionChainAPIRequest.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

struct EvolutionChainAPIRequest: PokeAPIRequestable {

    let path: String

    init(id: Int) {
        self.path = "evolution-chain/\(id)"
    }
}

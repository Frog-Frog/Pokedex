//
//  PokemonSpeciesModel.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import DataStore
import Foundation

public struct PokemonSpeciesModel {

    /// 進化チェーンのID
    public let evolutionChainId: Int

    init(_ response: PokemonSpeciesResponse) {
        self.evolutionChainId = EvolutionChainIdGenerator.generate(from: response.evolutionChain.url)
    }
}

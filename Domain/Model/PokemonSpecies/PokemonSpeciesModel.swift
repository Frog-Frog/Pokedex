//
//  PokemonSpeciesModel.swift
//  Domain
//
//  Created by kanda_yuki on 2020/06/11.
//

import DataStore
import Foundation

public struct PokemonSpeciesModel {

    ///進化元PokemonSpeciesのID
    public let degenerationId: Int?

    init(_ response: PokemonSpeciesResponse) {
        self.degenerationId = PokemonEvolvesFromSpeciesIdGenerator.generate(from: response.evolvesFromSpecies?.url)
    }
}

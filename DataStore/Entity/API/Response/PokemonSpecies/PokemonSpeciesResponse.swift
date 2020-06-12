//
//  PokemonSpeciesResponse.swift
//  DataStore
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

public struct PokemonSpeciesResponse: Decodable {

    ///The identifier for this resource.(PokemonSpeciesのid)
    public let id: Int

    ///The name for this resource.(ポケモンの名前)
    public let name: String

    ///The Pokémon species that evolves into this Pokemon_species.(進化元ポケモンの種類)
    public let evolvesFromSpecies: EvolvesFromSpecies?
}

extension PokemonSpeciesResponse {

    public struct EvolvesFromSpecies: Decodable {

        public let name: String

        public let url: String
    }
}

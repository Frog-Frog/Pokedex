//
//  PokemonSpeciesResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

@testable import DataStore

extension PokemonSpeciesResponse {

    static var stub: Self {
        return .init(id: 1,
                     name: "",
                     order: 0,
                     genderRate: 0,
                     captureRate: 0,
                     baseHappiness: 0,
                     isBaby: false,
                     hatchCounter: 0,
                     hasGenderDifferences: false,
                     formsSwitchable: false,
                     growthRate: .init(name: "", url: ""),
                     pokedexNumbers: [],
                     eggGroups: [],
                     color: .init(name: "", url: ""),
                     shape: .init(name: "", url: ""),
                     evolvesFromSpecies: nil,
                     evolutionChain: .init(url: "https://pokeapi.co/api/v2/evolution-chain/1/"),
                     habitat: nil,
                     generation: .init(name: "", url: ""),
                     names: [],
                     palParkEncounters: [],
                     flavorTextEntries: [],
                     formDescriptions: [],
                     genera: [],
                     varieties: [])
    }
}

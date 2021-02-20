//
//  PokemonDetailResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

@testable import DataStore

extension PokemonDetailResponse {

    static var stub: Self {
        return .init(id: 1,
                     name: "",
                     baseExperience: 0,
                     height: 0,
                     weight: 0,
                     isDefault: false,
                     order: 0,
                     abilities: [],
                     forms: [],
                     gameIndices: [],
                     heldItems: [],
                     locationAreaEncounters: "",
                     moves: [],
                     sprites: .init(backDefault: nil,
                                    backShiny: nil,
                                    backFemale: nil,
                                    backShinyFemale: nil,
                                    frontDefault: nil,
                                    frontShiny: nil,
                                    frontFemale: nil,
                                    frontShinyFemale: nil),
                     species: .init(name: "", url: ""),
                     stats: [],
                     types: [])
    }
}

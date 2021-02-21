//
//  EvolutionChainResponse.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/20.
//

@testable import DataStore

extension EvolutionChainResponse {

    static var bulbasaurStub: Self {
        return .init(id: 1, chain: .bulbasaurStub, babyTriggerItem: nil)
    }

    static var eeveeStub: Self {
        return .init(id: 67, chain: .eeveeStub, babyTriggerItem: nil)
    }

    static var kangaskhanStub: Self {
        return .init(id: 53, chain: .kangaskhanStub, babyTriggerItem: nil)
    }
}

// MARK: - Bulbasaur
extension EvolutionChainResponse.ChainLink {

    static var bulbasaurStub: Self {
        return .init(evolutionDetails: [],
                     evolvesTo: [.ivysaurStub],
                     isBaby: false,
                     species: .init(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
    }

    static var ivysaurStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil,
                  minLevel: 16,
                  needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [.venusaurStub],
        isBaby: false,
        species: .init(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon-species/2/"))
    }

    static var venusaurStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil,
                  minLevel: 32,
                  needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon-species/2/"))
    }
}

// MARK: - Eevee
extension EvolutionChainResponse.ChainLink {

    static var eeveeStub: Self {
        return .init(evolutionDetails: [],
                     evolvesTo: [
                        .vaporeonStub,
                        .jolteonStub,
                        .flareonStub,
                        .espeonStub,
                        .umbreonStub,
                        .leafeonStub,
                        .glaceonStub,
                        .sylveonStub
                     ],
                     isBaby: false,
                     species: .init(name: "eevee", url: "https://pokeapi.co/api/v2/pokemon-species/133/"))
    }

    static var vaporeonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "use-item", url: "https://pokeapi.co/api/v2/evolution-trigger/3/"),
                  gender: nil, heldItem: nil,
                  item: .init(name: "water-stone", url: "https://pokeapi.co/api/v2/item/84/"),
                  knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "vaporeon", url: "https://pokeapi.co/api/v2/pokemon-species/134/"))
    }

    static var jolteonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "use-item", url: "https://pokeapi.co/api/v2/evolution-trigger/3/"),
                  gender: nil, heldItem: nil,
                  item: .init(name: "thunder-stone", url: "https://pokeapi.co/api/v2/item/83/"),
                  knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false,partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "jolteon", url: "https://pokeapi.co/api/v2/pokemon-species/135/"))
    }

    static var flareonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "use-item", url: "https://pokeapi.co/api/v2/evolution-trigger/3/"),
                  gender: nil, heldItem: nil,
                  item: .init(name: "fire-stone", url: "https://pokeapi.co/api/v2/item/82/"),
                  knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "flareon", url: "https://pokeapi.co/api/v2/pokemon-species/136/"))
    }

    static var espeonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil,
                  minHappiness: 220,
                  minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil,
                  timeOfDay: "day",
                  tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "espeon", url: "https://pokeapi.co/api/v2/pokemon-species/196/"))
    }

    static var umbreonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil,
                  minHappiness: 220,
                  minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil,
                  timeOfDay: "night",
                  tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "umbreon", url: "https://pokeapi.co/api/v2/pokemon-species/197/"))
    }

    static var leafeonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "eterna-forest", url: "https://pokeapi.co/api/v2/location/8/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "pinwheel-forest", url: "https://pokeapi.co/api/v2/location/375/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "kalos-route-20", url: "https://pokeapi.co/api/v2/location/650/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "use-item", url: "https://pokeapi.co/api/v2/evolution-trigger/3/"),
                  gender: nil, heldItem: nil,
                  item: .init(name: "leaf-stone", url: "https://pokeapi.co/api/v2/item/85/"),
                  knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "leafeon", url: "https://pokeapi.co/api/v2/pokemon-species/470/"))
    }

    static var glaceonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "sinnoh-route-217", url: "https://pokeapi.co/api/v2/location/48/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "twist-mountain", url: "https://pokeapi.co/api/v2/location/380/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil, knownMoveType: nil,
                  location: .init(name: "frost-cavern", url: "https://pokeapi.co/api/v2/location/640/"),
                  minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false),
            .init(trigger: .init(name: "use-item", url: "https://pokeapi.co/api/v2/evolution-trigger/3/"),
                  gender: nil, heldItem: nil,
                  item: .init(name: "ice-stone", url: "https://pokeapi.co/api/v2/item/885/"),
                  knownMove: nil, knownMoveType: nil, location: nil, minAffection: nil, minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "glaceon", url: "https://pokeapi.co/api/v2/pokemon-species/471/"))
    }

    static var sylveonStub: Self {
        return .init(evolutionDetails: [
            .init(trigger: .init(name: "level-up", url: "https://pokeapi.co/api/v2/evolution-trigger/1/"),
                  gender: nil, heldItem: nil, item: nil, knownMove: nil,
                  knownMoveType: .init(name: "fairy", url: "https://pokeapi.co/api/v2/type/18/"),
                  location: nil,
                  minAffection: 2,
                  minBeauty: nil, minHappiness: nil, minLevel: nil, needsOverworldRain: false, partySpecies: nil, partyType: nil, relativePhysicalStats: nil, timeOfDay: "", tradeSpecies: nil, turnUpsideDown: false)
        ],
        evolvesTo: [],
        isBaby: false,
        species: .init(name: "sylveon", url: "https://pokeapi.co/api/v2/pokemon-species/700/"))
    }
}

extension EvolutionChainResponse.ChainLink {

    static var kangaskhanStub: Self {
        return .init(evolutionDetails: [],
                     evolvesTo: [],
                     isBaby: false,
                     species: .init(name: "kangaskhan", url: "https://pokeapi.co/api/v2/pokemon-species/115/"))
    }
}

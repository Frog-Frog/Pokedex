//
//  PokeonType.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import DataStore
import Foundation

public enum PokemonType: String {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case unknown
    case shadow

    init?(_ pokemonType: PokemonDetailResponse.PokemonType) {
        if let type = PokemonType(rawValue: pokemonType.type.name) {
            self =  type
        } else {
            return nil
        }
    }

    public var text: String {
        return self.rawValue.capitalizingFirstLetter()
    }

    public var hex: String {
        switch self {
        case .normal:
            return "A0A0A0"
        case .fighting:
            return "E85157"
        case .flying:
            return "5496EE"
        case .poison:
            return "9B62C0"
        case .ground:
            return "BD9B31"
        case .rock:
            return "F7BF1D"
        case .bug:
            return "45C648"
        case .ghost:
            return "6258A7"
        case .steel:
            return "707794"
        case .fire:
            return "FE9854"
        case .water:
            return "55BAF6"
        case .grass:
            return "8BBD0B"
        case .electric:
            return "E3CF0A"
        case .psychic:
            return "E462F1"
        case .ice:
            return "54E6F3"
        case .dragon:
            return "FC7447"
        case .dark:
            return "556CCB"
        case .fairy:
            return "F85F89"
        case .unknown:
            return "282828"
        case .shadow:
            return "2A373E"
        }
    }
}

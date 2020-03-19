//
//  PokemonDetailData.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

public struct PokemonDetailData {

    public let segments: [Segment]

    /// お気に入りしているかどうか
    public let isFavorite: Bool

    init(_ data: (response: PokemonDetailResponse, isFavorite: Bool)) {
        self.segments = Segment.generate(from: data.response)
        self.isFavorite = data.isFavorite
    }
}

extension PokemonDetailData {
    
    public enum Segment {
        case kind(number: Int, name: String)
        case image(frontUrl: String, backUrl: String)
        case type(Type)
        case body(dmHeight: Int, hgWeight: Int)

        static func generate(from response: PokemonDetailResponse) -> [Segment] {
            var segments = [Segment]()
            
            segments.append(.kind(number: response.id, name: response.name))

            let frontUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(response.id).png"
            let backUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/\(response.id).png"
            segments.append(.image(frontUrl: frontUrl, backUrl: backUrl))

            response.types
                .sorted { $0.slot < $1.slot }
                .compactMap { Type($0) }
                .forEach { segments.append(.type($0)) }
        
            segments.append(.body(dmHeight: response.height, hgWeight: response.weight))
            
            return segments
        }
    }
}

extension PokemonDetailData {

    public enum `Type`: String {
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
            if let type = Type(rawValue: pokemonType.type.name) {
                self =  type
            }
            else {
                return nil
            }
        }

        var text: String {
            return self.rawValue
        }

        var hex: String {
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
}

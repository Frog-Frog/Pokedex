//
//  Status.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/29.
//

import Foundation

public struct PokemonStatus {

    public let type: `Type`

    public let value: Int

    init?(name: String, value: Int) {
        guard let type = Type(rawValue: name) else {
            return nil
        }
        self.type = type
        self.value = value
    }
}

extension PokemonStatus {

    public enum `Type`: String {
        case hp
        case attack
        case defense
        case specialAttack
        case specialDefense
        case speed

        public init?(rawValue: String) {
            switch rawValue {
            case "hp":
                self = .hp
            case "attack":
                self = .attack
            case "defense":
                self = .defense
            case "special-attack":
                self = .specialAttack
            case "special-defense":
                self = .specialDefense
            case "speed":
                self = .speed
            default:
                return nil
            }
        }

        var priority: Int {
            switch self {
            case .hp:
                return 0
            case .attack:
                return 1
            case .defense:
                return 2
            case .specialAttack:
                return 3
            case .specialDefense:
                return 4
            case .speed:
                return 5
            }
        }

        public var text: String {
            switch self {
            case .hp:
                return "HP"
            case .attack:
                return "Attack"
            case .defense:
                return "Defense"
            case .specialAttack:
                return "SP.Atk"
            case .specialDefense:
                return "SP.Def"
            case .speed:
                return "Speed"
            }
        }

        public var hex: String {
            switch self {
            case .hp:
                return "1DD1A1"
            case .attack:
                return "EE5253"
            case .defense:
                return "0ABDE3"
            case .specialAttack:
                return "FF9F43"
            case .specialDefense:
                return "5F27CD"
            case .speed:
                return "48DBFB"
            }
        }
    }
}

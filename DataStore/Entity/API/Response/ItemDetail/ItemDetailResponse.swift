//
//  ItemDetailResponse.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public struct ItemDetailResponse: Decodable {

    /// The identifier for this resource.(このアイテムの固有識別番号)
    public let id: Int

    /// The name for this resource.(このアイテムの名前)
    public let name: String

    /// A list of attributes this item has.(このアイテムの属性)
    public let attributes: [Attribute]

    /// The category of items this item falls into.(このアイテムのカテゴリ)
    public let category: Category

    /// The price of this item in stores.(ショップでの価格)
    public let cost: Int

    /// The effect of this ability listed in different languages.(さまざまな言語でのアイテムの効果説明)
    public let effectEntries: [EffectEntry]?

    /// The flavor text of this ability listed in different languages.(さまざまな言語でのフレーバーテキスト)
    public let flavorTextEntries: [FlavorTextEntry]?

    /// A list of game indices relevent to this item by generation.(このアイテムが登場するゲームのリスト)
    public let gameIndices: [GameIndice]?

    /// A list of Pokémon that might be found in the wild holding this item.(このアイテムを持っている可能性のある野生のポケモン)
    public let heldByPokemon: [HeldByPokemon]?

    /// A list of the machines related to this item.(このアイテムに関連するマシンの一覧)
    public let machines: [MachineEntry]?

    /// The name of this item listed in different languages.(さまざまな言語での名前)
    public let names: [Name]?

    /// A set of sprites used to depict this item in the game.(ゲーム上での見た目)
    public let sprites: Sprite?

    /// An evolution chain this item requires to produce a bay during mating.(???)
    public let babyTriggerFor: BabyTrigger?

    /// The effect of the move Fling when used with this item.(???)
    public let flingEffect: FlingEffect?

    /// The power of the move Fling when used with this item.(???)
    public let flingPower: String?
}

// MARK: - Attribute(属性)
extension ItemDetailResponse {

    public struct Attribute: Decodable {

        public let name: String

        public let url: String
    }
}

// MARK: - Category(カテゴリ)
extension ItemDetailResponse {

    public struct Category: Decodable {

        public let name: String

        public let url: String
    }
}

// MARK: - HeldByPokemon(所持している野生のポケモン)
extension ItemDetailResponse {

    public struct HeldByPokemon: Decodable {

        public let pokemon: Pokemon

        public let versionDetails: [VersionDetail]
    }
}

extension ItemDetailResponse.HeldByPokemon {

    public struct Pokemon: Decodable {

        public let name : String

        public let url : String
    }

    public struct VersionDetail: Decodable {

        public let rarity: Int

        public let version: Version
    }
}

extension ItemDetailResponse.HeldByPokemon.VersionDetail {

    public struct Version: Decodable {

        public let name : String

        public let url : String
    }
}

// MARK: - Sprite(見た目)
extension ItemDetailResponse {

    public struct Sprite : Decodable {

        public let `default`: String
    }
}

// MARK: - Name(名前)
extension ItemDetailResponse {

    public struct Name: Decodable {

        public let name: String

        public let language: Language
    }
}

// MARK: - Language(言語)
extension ItemDetailResponse {

    public struct Language: Decodable {

        public let name: String

        public let url: String
    }
}

// MARK: - GameIndice(ゲーム種別)
extension ItemDetailResponse {

    public struct GameIndice: Decodable {

        public let gameIndex : Int

        public let generation : Generation
    }
}

extension ItemDetailResponse.GameIndice {

    public struct Generation: Decodable {

        public let name: String

        public let url: String
    }
}

// MARK: - FlavorText
extension ItemDetailResponse {

    public struct FlavorTextEntry: Decodable {

        public let language : Language

        public let text : String

        public let versionGroup : VersionGroup
    }
}

// MARK: - VersionGroup
extension ItemDetailResponse {

    public struct VersionGroup: Decodable {

        public let name: String

        public let url: String
    }
}

// MARK: - Effect
extension ItemDetailResponse {

    public struct EffectEntry: Decodable {

        public let language: Language

        public let shortEffect: String

        public let effect: String
    }
}

// MARK: - MachineEntry
extension ItemDetailResponse {

    public struct MachineEntry: Decodable {

        public let machine: Machine

        public let versionGroup: VersionGroup
    }
}

extension ItemDetailResponse.MachineEntry {

    public struct Machine: Decodable {

        public let url: String
    }
}

// MARK: - BabyTrigger
extension ItemDetailResponse {

    public struct BabyTrigger: Decodable {

        let url: String
    }
}

// MARK: - FlingEffect
extension ItemDetailResponse {

    public struct FlingEffect: Decodable {

        let name: String

        let url: String
    }
}

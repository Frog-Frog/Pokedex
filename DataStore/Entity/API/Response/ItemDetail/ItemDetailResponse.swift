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

    /// A set of sprites used to depict this item in the game.(ゲーム上での見た目)
    public let sprites: Sprite

    /// A list of attributes this item has.(このアイテムの属性)
    public let attributes: [NamedURLResource]

    /// The category of items this item falls into.(このアイテムのカテゴリ)
    public let category: NamedURLResource

    /// The price of this item in stores.(ショップでの価格)
    public let cost: Int

    /// A list of Pokémon that might be found in the wild holding this item.(このアイテムを持っている可能性のある野生のポケモン)
    public let heldByPokemon: [HeldByPokemon]

    /// The effect of this ability listed in different languages.(さまざまな言語でのアイテムの効果説明)
    public let effectEntries: [EffectEntry]

    /// The flavor text of this ability listed in different languages.(さまざまな言語でのフレーバーテキスト)
    public let flavorTextEntries: [FlavorTextEntry]

    /// A list of game indices relevent to this item by generation.(このアイテムが登場するゲームのリスト)
    public let gameIndices: [GameIndice]

    /// A list of the machines related to this item.(このアイテムに関連するマシンの一覧)
    public let machines: [MachineEntry]

    /// The name of this item listed in different languages.(さまざまな言語での名前)
    public let names: [Name]

    /// An evolution chain this item requires to produce a bay during mating.(???)
    public let babyTriggerFor: URLResource?

    /// The effect of the move Fling when used with this item.(???)
    public let flingEffect: NamedURLResource?

    /// The power of the move Fling when used with this item.(???)
    public let flingPower: Int?
}

// MARK: - HeldByPokemon(所持している野生のポケモン)
extension ItemDetailResponse {

    public struct HeldByPokemon: Decodable {

        public let pokemon: NamedURLResource

        public let versionDetails: [VersionDetail]
    }
}

extension ItemDetailResponse.HeldByPokemon {

    public struct VersionDetail: Decodable {

        public let rarity: Int

        public let version: NamedURLResource
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

        public let language: NamedURLResource
    }
}

// MARK: - GameIndice(ゲーム種別)
extension ItemDetailResponse {

    public struct GameIndice: Decodable {

        public let gameIndex : Int

        public let generation : NamedURLResource
    }
}

// MARK: - FlavorText
extension ItemDetailResponse {

    public struct FlavorTextEntry: Decodable {

        public let language : NamedURLResource

        public let text : String

        public let versionGroup : NamedURLResource
    }
}

// MARK: - Effect
extension ItemDetailResponse {

    public struct EffectEntry: Decodable {

        public let language: NamedURLResource

        public let shortEffect: String

        public let effect: String
    }
}

// MARK: - MachineEntry
extension ItemDetailResponse {

    public struct MachineEntry: Decodable {

        public let machine: URLResource

        public let versionGroup: NamedURLResource
    }
}

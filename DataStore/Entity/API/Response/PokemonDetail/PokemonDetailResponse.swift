//
//	PokemonDetailResponse.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import Foundation

public struct PokemonDetailResponse: Decodable {

    /// The identifier for this resource.(図鑑でのNo)
    public let id: Int

    /// The name for this resource.(ポケモン名)
    public let name: String

    /// The base experience gained for defeating this Pokémon.(このポケモンを倒して得られる経験値)
    public let baseExperience: Int

    /// The height of this Pokémon in decimetres.(このポケモンの身長[1dm = 10cm])
    public let height: Int

    /// The weight of this Pokémon in hectograms.(このポケモンの体重[1hg = 100g])
    public let weight: Int

    /// Set for exactly one Pokémon used as the default for each species.(???)
    public let isDefault: Bool

    /// Order for sorting. Almost national order, except families are grouped together.(???)
    public let order: Int

    /// A list of abilities this Pokémon could potentially have.(このポケモンが持つことができる特性のリスト)
    public let abilities: [PokemonAbility]

    /// A list of forms this Pokémon can take on.(ポケモンの外観の一覧)
    public let forms: [NamedURLResource]

    /// A list of game indices relevent to Pokémon item by generation.(このポケモンが登場するバージョンの配列)
    public let gameIndices: [VersionGameIndex]

    /// A list of items this Pokémon may be holding when encountered.(このポケモンを野生で遭遇した時に所有しているかもしれないアイテムのリスト)
    public let heldItems: [HeldItem]

    /// A link to a list of location areas, as well as encounter details pertaining to specific versions.(生息地情報のURL)
    public let locationAreaEncounters: String

    /// A list of moves along with learn methods and level details pertaining to specific version groups.(バージョン毎のワザを習得する方法とレベルのリスト)
    public let moves: [PokemonMove]

    /// A set of sprites used to depict this Pokémon in the game.(ゲーム上での見た目)
    public let sprites: Sprite

    /// The species this Pokémon belongs to.(このポケモンが属する種類)
    public let species: NamedURLResource

    /// A list of base stat values for this Pokémon.(このポケモンのステータスのリスト)
    public let stats: [PokemonStat]

    /// A list of details showing types this Pokémon has.(このポケモンが保有するタイプのリスト)
    public let types: [PokemonType]

}

// MARK: - Ability(特性)
extension PokemonDetailResponse {

    public struct PokemonAbility: Decodable {

        /// The ability the Pokémon may have.(特性情報)
        public let ability: NamedURLResource

        /// Whether or not this is a hidden ability.(隠し特性かどうか)
        public let isHidden: Bool

        /// The slot this ability occupies in this Pokémon species.(???)
        public let slot: Int
    }
}

// MARK: - HeldItem(持ち物)
extension PokemonDetailResponse {

    public struct HeldItem: Decodable {

        /// The item the referenced Pokémon holds.(ポケモンが持っているアイテム)
        public let item: NamedURLResource

        /// The details of the different versions in which the item is held.(このアイテムを保有しているバージョンの一覧)
        public let versionDetails: [VersionDetail]
    }
}

extension PokemonDetailResponse.HeldItem {

    public struct VersionDetail: Decodable {

        /// How often the item is held.(アイテムを保持している頻度)
        public let rarity: Int

        /// The version in which the item is held.(アイテムが保有されるバージョン)
        public let version: NamedURLResource
    }
}

// MARK: - Move(技)
extension PokemonDetailResponse {

    public struct PokemonMove: Decodable {

        /// The move the Pokémon can learn.(ポケモンが習得可能な技)
        public let move: NamedURLResource?

        /// The details of the version in which the Pokémon can learn the move.(ポケモンが習得可能な技についてのバージョン毎の詳細の一覧)
        public let versionGroupDetails: [VersionGroupDetail]
    }
}

extension PokemonDetailResponse.PokemonMove {

    public struct VersionGroupDetail: Decodable {

        /// The minimum level to learn the move.(技を習得する最小レベル)
        public let levelLearnedAt: Int

        /// The method by which the move is learned.(技を習得する方法)
        public let moveLearnMethod: NamedURLResource

        /// The version group in which the move is learned.(バージョン情報)
        public let versionGroup: NamedURLResource
    }
}

// MARK: - Sprite(見た目)
extension PokemonDetailResponse {

    public struct Sprite: Decodable {

        /// The default depiction of this Pokémon from the back in battle.(後ろ姿)
        public let backDefault: String?

        /// The shiny depiction of this Pokémon from the back in battle.(色違いの後ろ姿)
        public let backShiny: String?

        /// The female depiction of this Pokémon from the back in battle.(後ろ姿♀)
        public let backFemale: String?

        /// The shiny female depiction of this Pokémon from the back in battle.(色違いの後ろ姿♀)
        public let backShinyFemale: String?

        /// The default depiction of this Pokémon from the front in battle.(正面)
        public let frontDefault: String?

        /// The shiny depiction of this Pokémon from the front in battle.(色違いの正面)
        public let frontShiny: String?

        /// The female depiction of this Pokémon from the front in battle.(正面♀)
        public let frontFemale: String?

        /// The shiny female depiction of this Pokémon from the front in battle.(色違いの正面♀)
        public let frontShinyFemale: String?
    }
}

// MARK: - Stat(ステータス)
extension PokemonDetailResponse {

    public struct PokemonStat: Decodable {

        ///The stat the Pokémon has.(ポケモンが持っているステータス)
        public let stat: NamedURLResource

        /// The base value of the stat.(基本のステータス値)
        public let baseStat: Int

        /// The effort points (EV) the Pokémon has in the stat.(努力値)
        public let effort: Int
    }
}

// MARK: - Type(タイプ)
extension PokemonDetailResponse {

    public struct PokemonType: Decodable {

        /// The order the Pokémon's types are listed in.(ポケモンのタイプがリストされる際の順序)
        public let slot: Int

        /// The type the referenced Pokémon has.(ポケモンが保有するタイプ)
        public let type: NamedURLResource
    }
}

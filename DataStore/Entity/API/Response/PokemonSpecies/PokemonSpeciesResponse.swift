//
//  PokemonSpeciesResponse.swift
//  DataStore
//
//  Created by kanda_yuki on 2020/06/11.
//

import Foundation

public struct PokemonSpeciesResponse: Decodable {

    /// The identifier for this resource.(ポケモンのID)
    public let id: Int

    /// The name for this resource.(ポケモンの名前)
    public let name: String

    /// The order in which species should be sorted. Based on National Dex order, except families are grouped together and sorted by stage.(種を並べ替える順序。全国図鑑の順序に基づきます。ただし、家族はグループ化され、ステージごとに並べ替えられます。)
    public let order: Int

    /// The chance of this Pokémon being female, in eighths; or -1 for genderless.(ポケモンが女性である可能性は8分の1。ジェンダーレスの場合は-1。)
    public let genderRate: Int

    /// The base capture rate; up to 255. The higher the number, the easier the catch.(基本捕獲率。 最大255。数値が大きいほど、捕獲が容易になる)
    public let captureRate: Int

    /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon.(通常のモンスターボールに捕まったときの幸福度。 最大255。数字が大きいほど、ポケモンは幸せになる)
    public let baseHappiness: Int

    /// Whether or not this is a baby Pokémon.(赤ちゃんポケモンかどうか)
    public let isBaby: Bool

    /// Initial hatch counter: one must walk 255 × (hatch_counter + 1) steps before this Pokémon's egg hatches, unless utilizing bonuses like Flame Body's.(孵化カウンター：「ほのおのからだ」のようなボーナスを利用しない限り、このポケモンの卵の孵化の前に255×（hatch_counter + 1)ステップ歩く必要があります。)
    public let hatchCounter: Int

    /// Whether or not this Pokémon has visual gender differences.(このポケモンに視覚的な性差があるかどうか)
    public let hasGenderDifferences: Bool

    /// Whether or not this Pokémon has multiple forms and can switch between them.(このポケモンに複数のフォームがあり、それらを切り替えることができるかどうか)
    public let formsSwitchable: Bool

    /// The rate at which this Pokémon species gains levels.(このポケモン種がレベルを上げる度合い)
    public let growthRate: NamedURLResource

    /// A list of Pokedexes and the indexes reserved within them for this Pokémon species.(このポケモンが登録されているポケモン図鑑とインデックスのリスト)
    public let pokedexNumbers: [PokedexNumber]

    /// A list of egg groups this Pokémon species is a member of.(このポケモンが属しているたまごグループ)
    public let eggGroups: [NamedURLResource]

    /// The color of this Pokémon for Pokédex search.(ポケモン図鑑検索用のポケモンの色)
    public let color: NamedURLResource

    /// The shape of this Pokémon for Pokédex search.(ポケモン図鑑検索用のポケモンの形状)
    public let shape: NamedURLResource

    /// The Pokémon species that evolves into this Pokemon_species.(進化元ポケモンの種類)
    public let evolvesFromSpecies: NamedURLResource?

    /// The evolution chain this Pokémon species is a member of.(このポケモンが属している進化の連鎖)
    public let evolutionChain: URLResource?

    /// The habitat this Pokémon species can be encountered in.(このポケモンの生息場所)
    public let habitat: NamedURLResource?

    /// The generation this Pokémon species was introduced in.(このポケモン種が導入された世代)
    public let generation: NamedURLResource

    /// The name of this resource listed in different languages.(さまざまな言語でリストされたこのポケモンの名前)
    public let names: [Name]

    /// A list of encounters that can be had with this Pokémon species in pal park.(パルパークでこのポケモンと遭遇することができる出会いのリスト)
    public let palParkEncounters: [PalParkEncounter]

    /// A list of flavor text entries for this Pokémon species.(このポケモンの説明文のリスト。)
    public let flavorTextEntries: [FlavorTextEntry]

    /// Descriptions of different forms Pokémon take on within the Pokémon species.(ポケモン種の中でポケモンがとるさまざまな形の説明。)
    public let formDescriptions: [FormDescription]

    /// The genus of this Pokémon species listed in multiple languages.(複数の言語でリストされたこのポケモンの属性)
    public let genera: [Genus]

    /// A list of the Pokémon that exist within this Pokémon species.(このポケモン種に存在するポケモンのリスト)
    public let varieties: [Variety]
}

extension PokemonSpeciesResponse {

    public struct PokedexNumber: Decodable {

        /// The index number within the Pokédex.(ポケモン図鑑に収録されている番号)
        public let entryNumber: Int

        /// The Pokédex the referenced Pokémon species can be found in.(参照されているポケモンが含まれているポケモン図鑑)
        public let pokedex: NamedURLResource
    }
}

extension PokemonSpeciesResponse {

    public struct Name: Decodable {

        /// The name for this resource.(ポケモンの名前)
        public let name: String

        /// The language this name is in.(名前の言語)
        public let language: NamedURLResource
    }
}

extension PokemonSpeciesResponse {

    public struct PalParkEncounter: Decodable {

        /// The pal park area where this encounter happens.(遭遇するパルパークのエリア)
        public let area: NamedURLResource

        /// The base score given to the player when the referenced Pokémon is caught during a pal park run.(ポケモンを公園で捕獲した際に、プレーヤーに与えられる基本スコア。)
        public let baseScore: Int

        /// The base rate for encountering the referenced Pokémon in this pal park area.(参照されているポケモンのパルパークのエリアでの遭遇率)
        public let rate: Int
    }
}

extension PokemonSpeciesResponse {

    public struct FlavorTextEntry: Decodable {

        /// The localized flavor text for an API resource in a specific language.(特定の言語でローカライズされた説明文)
        public let flavorText: String

        /// The language this name is in.(説明文の言語)
        public let language: NamedURLResource

        /// The game version this flavor text is extracted from.(この説明文が抽出されたゲームバージョン)
        public let version: NamedURLResource
    }
}

extension PokemonSpeciesResponse {

    public struct FormDescription: Decodable {

        /// The localized description for an API resource in a specific language.(特定の言語でローカライズされたフォームの説明文)
        public let description: String

        /// The language this name is in.(説明文の言語)
        public let language: NamedURLResource
    }
}

extension PokemonSpeciesResponse {

    public struct Genus: Decodable {

        /// The localized genus for the referenced Pokémon species(参照されているポケモンのローカライズされた属性名)
        public let genus: String

        /// The language this genus is in.(属性名の言語)
        public let language: NamedURLResource
    }
}

extension PokemonSpeciesResponse {

    public struct Variety: Decodable {

        /// Whether this variety is the default variety.(デフォルトの品種であるかどうか)
        public let isDefault: Bool

        /// The Pokémon variety.(ポケモンの種類)
        public let pokemon: NamedURLResource
    }
}

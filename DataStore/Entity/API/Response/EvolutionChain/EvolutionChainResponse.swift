//
//  EvolutionChainResponse.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

public struct EvolutionChainResponse: Decodable {

    /// The identifier for this resource.(この進化チェーンの固有識別番号)
    public let id: Int

    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.(進化情報の詳細)
    public let chain: ChainLink

    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon.(???)
    public let babyTriggerItem: NamedURLResource?
}

extension EvolutionChainResponse {

    public struct ChainLink: Decodable {

        /// All details regarding the specific details of the referenced Pokémon species evolution.(進化についての詳細情報)
        public let evolutionDetails: [EvolutionDetail]

        /// A List of chain objects.(進化先のポケモンの配列)
        public let evolvesTo: [ChainLink]

        /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.(赤ちゃんのポケモンのためのものであるかどうか。これは、ベースリンクでのみ当てはまる)
        public let isBaby: Bool

        /// The Pokémon species at this point in the evolution chain.(進化元ポケモン)
        public let species: NamedURLResource
    }
}

extension EvolutionChainResponse {

    public struct EvolutionDetail: Decodable {

        /// The type of event that triggers evolution into this Pokémon species.(このポケモンの進化のトリガー種別)
        let trigger: NamedURLResource?

        /// The id of the gender of the evolving Pokémon species must be in order to evolve into this Pokémon species.(進化に必要な性別のid)
        let gender: Int?

        /// The item the evolving Pokémon species must be holding during the evolution trigger event to evolve into this Pokémon species.(進化するためにポケモンに所有させなければならないアイテム)
        let heldItem: NamedURLResource?

        /// The item required to cause evolution this into Pokémon species.(進化するために使用するアイテム)
        let item: NamedURLResource?

        /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species.(進化するために覚えておかなければならない技)
        let knownMove: NamedURLResource?

        /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species.(進化するために覚えておかなければならない技のタイプ)
        let knownMoveType: NamedURLResource?

        /// The location the evolution must be triggered at.(進化のトリガーとなる場所)
        let location: NamedURLResource?

        /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species.(進化に最低限必要な愛情値)
        let minAffection: Int?

        /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species.(進化に最低限必要な美しさの値)
        let minBeauty: Int?

        /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species.(進化に最低限必要な幸福度の値)
        let minHappiness: Int?

        /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species.(進化に最低限必要なレベル)
        let minLevel: Int?

        /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species.(進化する際に天候が雨である必要があるかどうか)
        let needsOverworldRain: Bool

        /// The Pokémon species that must be in the players party in order for the evolving Pokémon species to evolve into this Pokémon species.(進化する際にパーティーに含めておかなければならない他のポケモン)
        let partySpecies: NamedURLResource?

        /// The player must have a Pokémon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species.(進化する際にパーティーに含めておかなければならない他のポケモンのタイプ)
        let partyType: NamedURLResource?

        /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.(進化する際のポケモンの攻撃と防御の値の関係。「1」は攻撃の方が高い、「0」は攻撃と防御が同じ数値、「-1」は防御の方が高い)
        let relativePhysicalStats: Int?

        /// The required time of day. Day or night.(進化に必要な時刻。昼もしくは夜)
        let timeOfDay: String?

        /// Pokémon species for which this one must be traded.(交換されなければいけないポケモン)
        let tradeSpecies: NamedURLResource?

        /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.(このポケモンを進化させる際に3DSを逆さまにさせる必要があるかどうか)
        let turnUpsideDown: Bool
    }
}

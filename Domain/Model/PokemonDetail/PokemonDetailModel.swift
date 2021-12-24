//
//  PokemonDetailData.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/03/11.
//

import DataStore
import Foundation

public struct PokemonDetailModel {

    public let number: Int

    public let name: String

    public let imageUrl: URL?

    public let subImageUrl: URL?

    public let typeHex: String

    public let information: Information

    public let stats: [PokemonStatus]

    init(_ response: PokemonDetailResponse) {
        self.number = response.id
        self.name = response.name.capitalizingFirstLetter()
        self.imageUrl = PokemonImageURLGenerator.generateImageURL(from: response.id)
        self.subImageUrl = PokemonImageURLGenerator.generateSubImageURL(from: response.id)
        self.typeHex = response.types.sorted { $0.slot < $1.slot }.compactMap { PokemonType($0) }.first!.hex
        self.information = Information(response)
        self.stats = response.stats.compactMap { PokemonStatus(name: $0.stat.name, value: $0.baseStat) }.sorted { $0.type.priority < $1.type.priority }
    }
}

extension PokemonDetailModel {

    public struct Information {

        public let types: [Type]

        init(_ response: PokemonDetailResponse) {
            var types = [Type]()

            let pokemonTypes = response.types.sorted { $0.slot < $1.slot }.compactMap { PokemonType($0) }
            types.append(.pokemonTypes(pokemonTypes))

            // dm -> m
            let mHeight = Float(response.height) / 10
            types.append(.height(mHeight))

            // hg -> kg
            let kgWeight = Float(response.weight) / 10
            types.append(.weight(kgWeight))

            var normalAbilities = response.abilities.filter { $0.isHidden == false }
            normalAbilities.sort { $0.slot < $1.slot }

            // 通常特性は1~2種類ある
            // 配列に入ってる + レイアウトでなしを表示したいのでクラッシュしない様にカウントで存在確認してから取り出す
            if normalAbilities.count == 1 {
                types.append(.firstAbility(normalAbilities[0].ability.name.capitalizingFirstLetter()))
                types.append(.secondAbility(nil))
            } else if normalAbilities.count > 1 {
                types.append(.firstAbility(normalAbilities[0].ability.name.capitalizingFirstLetter()))
                types.append(.secondAbility(normalAbilities[1].ability.name.capitalizingFirstLetter()))
            }

            if let hiddenAbility = response.abilities.first(where: { $0.isHidden == true }) {
                types.append(.hiddenAbblity(hiddenAbility.ability.name.capitalizingFirstLetter()))
            } else {
                types.append(.hiddenAbblity(nil))
            }

            self.types = types
        }
    }
}

extension PokemonDetailModel.Information {

    public enum `Type` {
        case pokemonTypes([PokemonType])
        case height(Float)
        case weight(Float)
        case firstAbility(String)
        case secondAbility(String?)
        case hiddenAbblity(String?)
    }
}

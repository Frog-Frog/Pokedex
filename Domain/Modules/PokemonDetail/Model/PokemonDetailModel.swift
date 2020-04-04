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

    public let segments: [Segment]

    public let typeHex: String

    /// お気に入りしているかどうか
    public let isFavorite: Bool

    init(_ data: (response: PokemonDetailResponse, isFavorite: Bool)) {
        self.number = data.response.id
        self.name = data.response.name
        self.segments = Segment.generate(from: data.response)
        self.typeHex = data.response.types.sorted { $0.slot < $1.slot }.compactMap { PokemonType($0) }.first?.hex ?? ""
        self.isFavorite = data.isFavorite
    }
}

extension PokemonDetailModel {

    public struct Segment {

        public let contents: [Content]

        static func generate(from response: PokemonDetailResponse) -> [Segment] {
            var segments = [Segment]()

            let frontImageUrl = response.sprites.frontDefault
            if let backImageUrl = response.sprites.backDefault {
                segments.append(.init(contents: [.dualImage(frontImageUrl: frontImageUrl, backImageUrl: backImageUrl)]))
            } else {
                segments.append(.init(contents: [.singleImage(frontImageUrl: frontImageUrl)]))
            }

            let types = response.types.sorted { $0.slot < $1.slot }.compactMap { PokemonType($0) }
            segments.append(.init(contents: [.pokemonTypes(types)]))

            // dm -> m
            let mHeight = Float(response.height) / 10
            // hg -> kg
            let kgWeight = Float(response.weight) / 10

            segments.append(.init(contents: [.height(mHeight), .weight(kgWeight)]))

            let stats = response.stats.compactMap { PokemonStatus(name: $0.stat.name, value: $0.baseStat) }
            let sortedStats = stats.sorted { $0.type.priority < $1.type.priority }
            segments.append(.init(contents: sortedStats.map { Content.status($0) }))

            return segments
        }
    }
}

extension PokemonDetailModel.Segment {

    public enum Content {
        case singleImage(frontImageUrl: String)
        case dualImage(frontImageUrl: String, backImageUrl: String)
        case pokemonTypes([PokemonType])
        case height(Float)
        case weight(Float)
        case status(PokemonStatus)
    }
}

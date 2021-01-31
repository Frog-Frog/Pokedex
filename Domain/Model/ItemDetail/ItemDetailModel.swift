//
//  ItemDetailModel.swift
//  Domain
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import DataStore
import Foundation

public struct ItemDetailModel {

    public let number: Int

    public let name: String

    public let imageUrl: URL

    public let heldByPokemons: [Pokemon]

    init(_ response: ItemDetailResponse) {
        self.number = response.id
        self.name = response.name
        self.imageUrl = URL(string: response.sprites.default)!
        self.heldByPokemons = response.heldByPokemon.map { Pokemon($0) }
    }
}

extension ItemDetailModel {

    public struct Pokemon {

        let name: String

        let number: Int

        let imageUrl: URL?

        init(_ heldByPokemon: ItemDetailResponse.HeldByPokemon) {
            self.name = heldByPokemon.pokemon.name
            self.number = PokemonNumberGenerator.generate(from: heldByPokemon.pokemon.url)
            self.imageUrl = PokemonImageURLGenerator.generateThumbnailURL(from: self.number)
        }
    }
}

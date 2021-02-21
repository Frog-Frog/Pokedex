//
//  PokemonNumberGeneratorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import Domain

final class PokemonNumberGeneratorTests: XCTestCase {

    func test_emptyUrl() {
        let emptyUrl = ""
        let number = PokemonNumberGenerator.generate(from: emptyUrl)
        XCTAssertEqual(number, 0)
    }

    func test_invalidUrl() {
        let itemUrl = "https://pokeapi.co/api/v2/item/1/"
        let number = PokemonNumberGenerator.generate(from: itemUrl)
        XCTAssertEqual(number, 0)
    }

    func test_pokemonUrl() {
        let pokemonUrl = "https://pokeapi.co/api/v2/pokemon/1/"
        let number = PokemonNumberGenerator.generate(from: pokemonUrl)
        XCTAssertEqual(number, 1)
    }

    func test_pokemonSpeciesUrl() {
        let pokemonSpeciesUrl = "https://pokeapi.co/api/v2/pokemon-species/1/"
        let number = PokemonNumberGenerator.generate(from: pokemonSpeciesUrl)
        XCTAssertEqual(number, 1)
    }
}

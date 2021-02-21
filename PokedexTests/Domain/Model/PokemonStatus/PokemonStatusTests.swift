//
//  PokemonStatusTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore
@testable import Domain

// MARK: - Initialize Tests
final class PokemonStatusTests: XCTestCase {

    func test_pokemonStatus_invalid() {
        let type = PokemonStatus(name: "invalid", value: 0)
        XCTAssertNil(type)
    }

    func test_pokemonStatus_success() {
        typealias TestCase = (name: String, expectType: PokemonStatus.`Type`, line: UInt)

        let testCases: [TestCase] = [
            (name: "hp", expectType: .hp, line: #line),
            (name: "attack", expectType: .attack, line: #line),
            (name: "defense", expectType: .defense, line: #line),
            (name: "special-attack", expectType: .specialAttack, line: #line),
            (name: "special-defense", expectType: .specialDefense, line: #line),
            (name: "speed", expectType: .speed, line: #line)
        ]

        testCases.forEach {
            if let status = PokemonStatus(name: $0.name, value: 0) {
                XCTAssertEqual(status.type, $0.expectType)
            } else {
                XCTFail("Unexpected PokemonStatus initialization has been performed.", line: $0.line)
            }
        }
    }
}

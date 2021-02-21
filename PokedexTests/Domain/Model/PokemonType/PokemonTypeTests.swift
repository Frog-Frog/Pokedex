//
//  PokemonTypeTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
@testable import DataStore
@testable import Domain

// MARK: - Initialize Tests
final class PokemonTypeTests: XCTestCase {

    func test_pokemonType_invalid() {
        let type = PokemonType(.init(slot: 0, type: .init(name: "invalid", url: "")))
        XCTAssertNil(type)
    }

    func test_pokemonType_success() {
        typealias TestCase = (name: String, expectType: PokemonType, line: UInt)

        let testCases: [TestCase] = [
            (name: "normal", expectType: .normal, line: #line),
            (name: "fighting", expectType: .fighting, line: #line),
            (name: "flying", expectType: .flying, line: #line),
            (name: "poison", expectType: .poison, line: #line),
            (name: "ground", expectType: .ground, line: #line),
            (name: "rock", expectType: .rock, line: #line),
            (name: "bug", expectType: .bug, line: #line),
            (name: "ghost", expectType: .ghost, line: #line),
            (name: "steel", expectType: .steel, line: #line),
            (name: "fire", expectType: .fire, line: #line),
            (name: "water", expectType: .water, line: #line),
            (name: "grass", expectType: .grass, line: #line),
            (name: "electric", expectType: .electric, line: #line),
            (name: "psychic", expectType: .psychic, line: #line),
            (name: "ice", expectType: .ice, line: #line),
            (name: "dragon", expectType: .dragon, line: #line),
            (name: "dark", expectType: .dark, line: #line),
            (name: "fairy", expectType: .fairy, line: #line),
            (name: "unknown", expectType: .unknown, line: #line),
            (name: "shadow", expectType: .shadow, line: #line)
        ]

        testCases.forEach {
            let testType = PokemonType(.init(slot: 0, type: .init(name: $0.name, url: "")))
            if let type = testType {
                XCTAssertEqual(type, $0.expectType)
            } else {
                XCTFail("Unexpected PokemonType initialization has been performed.", line: $0.line)
            }
        }
    }
}

// MARK: - Computed Property Tests
extension PokemonTypeTests {

    func test_pokemonType_name() {
        typealias TestCase = (type: PokemonType, line: UInt)

        let testCases: [TestCase] = [
            (type: .normal, line: #line),
            (type: .fighting, line: #line),
            (type: .flying, line: #line),
            (type: .poison, line: #line),
            (type: .ground, line: #line),
            (type: .rock, line: #line),
            (type: .bug, line: #line),
            (type: .ghost, line: #line),
            (type: .steel, line: #line),
            (type: .fire, line: #line),
            (type: .water, line: #line),
            (type: .grass, line: #line),
            (type: .electric, line: #line),
            (type: .psychic, line: #line),
            (type: .ice, line: #line),
            (type: .dragon, line: #line),
            (type: .dark, line: #line),
            (type: .fairy, line: #line),
            (type: .unknown, line: #line),
            (type: .shadow, line: #line)
        ]

        testCases.forEach {
            if $0.type.text.caseInsensitiveCompare($0.type.rawValue) == .orderedSame {
            } else {
                XCTFail("PokemonType return exception text.", line: $0.line)
            }
        }
    }

    func test_pokemonType_hex() {
        typealias TestCase = (type: PokemonType, line: UInt)

        let testCases: [TestCase] = [
            (type: .normal, line: #line),
            (type: .fighting, line: #line),
            (type: .flying, line: #line),
            (type: .poison, line: #line),
            (type: .ground, line: #line),
            (type: .rock, line: #line),
            (type: .bug, line: #line),
            (type: .ghost, line: #line),
            (type: .steel, line: #line),
            (type: .fire, line: #line),
            (type: .water, line: #line),
            (type: .grass, line: #line),
            (type: .electric, line: #line),
            (type: .psychic, line: #line),
            (type: .ice, line: #line),
            (type: .dragon, line: #line),
            (type: .dark, line: #line),
            (type: .fairy, line: #line),
            (type: .unknown, line: #line),
            (type: .shadow, line: #line)
        ]

        testCases.forEach {
            if Int("000000" + $0.type.hex, radix: 16) != nil {
                return
            } else {
                XCTFail("PokemonType return not hexadecimal format value.", line: $0.line)
            }
        }
    }
}

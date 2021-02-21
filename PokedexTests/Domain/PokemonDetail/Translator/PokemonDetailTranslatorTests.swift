//
//  PokemonDetailTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class PokemonDetailTranslatorTests: XCTestCase {

    private var translator: PokemonDetailTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = PokemonDetailTranslatorImpl()
    }
}

// MARK: - Translate Basic Data Tests
extension PokemonDetailTranslatorTests {

    func test_translate_basic_data() {
        let response = PokemonDetailResponse.bulbasaurStub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.name.caseInsensitiveCompare(response.name), .orderedSame)
        XCTAssertEqual(model.number, response.id)
        model.stats.forEach { stat in
            let responseValue = response.stats.first { return $0.stat.name == stat.type.responseName }?.baseStat
            XCTAssertEqual(stat.value, responseValue)
        }
    }

}

// MARK: - Translate Abilities Tests
extension PokemonDetailTranslatorTests {

    func test_traslate_single_ability() {
        let response = PokemonDetailResponse.bulbasaurStub

        let model = self.translator.convert(from: response)

        model.information.types.forEach {
            switch $0 {
            case .firstAbility(let value):
                XCTAssertNotEqual(value, "")
            case .secondAbility(let value):
                XCTAssertNil(value)
            default:
                break
            }
        }
    }

    func test_translate_dual_ability() {
        let response = PokemonDetailResponse.clefableStub

        let model = self.translator.convert(from: response)

        model.information.types.forEach {
            switch $0 {
            case .firstAbility(let value):
                XCTAssertNotEqual(value, "")
            case .secondAbility(let value):
                XCTAssertNotNil(value)
            default:
                break
            }
        }
    }

    func test_translate_hidden_ability() {
        let response = PokemonDetailResponse.bulbasaurStub

        let model = self.translator.convert(from: response)

        model.information.types.forEach {
            switch $0 {
            case .hiddenAbblity(let value):
                XCTAssertNotNil(value)
            default:
                break
            }
        }
    }

    func test_translate_no_hidden_ability() {
        let response = PokemonDetailResponse.zeraoraStub

        let model = self.translator.convert(from: response)

        model.information.types.forEach {
            switch $0 {
            case .hiddenAbblity(let value):
                XCTAssertNil(value)
            default:
                break
            }
        }
    }
}

private extension PokemonStatus.`Type` {

    var responseName: String {
        switch self {
        case .hp, .attack, .defense, .speed:
            return self.rawValue
        case .specialAttack:
            return "special-attack"
        case .specialDefense:
            return "special-defense"
        }
    }
}

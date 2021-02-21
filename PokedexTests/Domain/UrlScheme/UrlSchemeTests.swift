//
//  UrlSchemeTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2020/05/16.
//

import XCTest
import Domain

final class UrlSchemeTests: XCTestCase {

    func test_urlScheme_notUrlInitialize() {
        let scheme = UrlScheme("Not URL")
        XCTAssertNil(scheme)
    }

    func test_urlScheme_invalidSchemeInitialize() {
        let scheme = UrlScheme("invalid_scheme://open")
        XCTAssertNil(scheme)
    }

    func test_urlScheme_invalidHostInitialize() {
        let scheme = UrlScheme("pokedex://invalid_host")
        XCTAssertNil(scheme?.action)
    }

    func test_urlSCheme_invalidPathInitialize() {
        let scheme = UrlScheme("pokedex://open/invalid_path")
        switch scheme?.action {
        case .open(let type):
            switch type {
            case .none:
                // Success
                return
            default:
                break
            }
        default:
            break
        }
        XCTFail("Unexpected initialization has been performed.")
    }
}

// MARK: - Pokemon Detail
extension UrlSchemeTests {

    func test_urlScheme_pokemonDetail() {
        typealias TestCase = (query: String, expectNumber: Int, isExpectSuccess: Bool, line: UInt)

        let testCases: [TestCase] = [
            (query: "", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "name=charizard", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "number=not_number", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "number=1", expectNumber: 1, isExpectSuccess: true, line: #line)
        ]

        testCases.forEach {
            let scheme = UrlScheme("pokedex://open/pokemon_detail?\($0.query)")
            switch scheme?.action {
            case .open(let type):
                switch type {
                case .pokemonDetail(let number):
                    if number == $0.expectNumber {
                        if $0.isExpectSuccess {
                            return
                        }
                    }
                case nil:
                    if !$0.isExpectSuccess {
                        return
                    }
                default:
                    XCTFail("Unexpected PokemonDetail UrlScheme initialization has been performed.", line: $0.line)
                }
            case .none:
                break
            }
            XCTFail("Unexpected PokemonDetail UrlScheme initialization has been performed.", line: $0.line)
        }
    }
}

// MARK: - Item Detail
extension UrlSchemeTests {

    func test_urlScheme_itemDetail() {
        typealias TestCase = (query: String, expectNumber: Int, isExpectSuccess: Bool, line: UInt)

        let testCases: [TestCase] = [
            (query: "", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "name=master-ball", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "number=not_number", expectNumber: 0, isExpectSuccess: false, line: #line),
            (query: "number=1", expectNumber: 1, isExpectSuccess: true, line: #line)
        ]

        testCases.forEach {
            let scheme = UrlScheme("pokedex://open/item_detail?\($0.query)")
            switch scheme?.action {
            case .open(let type):
                switch type {
                case .itemDetail(let number):
                    if number == $0.expectNumber {
                        if $0.isExpectSuccess {
                            return
                        }
                    }
                case nil:
                    if !$0.isExpectSuccess {
                        return
                    }
                default:
                    XCTFail("Unexpected ItemDetail UrlScheme initialization has been performed.", line: $0.line)
                }
            case .none:
                break
            }
            XCTFail("Unexpected ItemDetail UrlScheme initialization has been performed.", line: $0.line)
        }
    }
}

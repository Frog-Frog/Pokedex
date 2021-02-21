//
//  EvolutionChainTranslatorTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import XCTest
import DataStore
@testable import Domain

final class EvolutionChainTranslatorTests: XCTestCase {

    private var translator: EvolutionChainTranslator!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.translator = EvolutionChainTranslatorImpl()
    }
}

// MARK: - ChainType Tests
extension EvolutionChainTranslatorTests {

    func test_translate_no_evolution() {
        let response = EvolutionChainResponse.kangaskhanStub

        let model = self.translator.convert(from: response)
        XCTAssertEqual(model.chainType, .none)
    }

    func test_translate_one_evolution() {
        let response = EvolutionChainResponse.eeveeStub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.chainType, .single)
    }

    func test_translate_two_evolution() {
        let response = EvolutionChainResponse.bulbasaurStub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.chainType, .dual)
    }
}

// MARK: - EvolutionChains Count Tests
extension EvolutionChainTranslatorTests {

    func test_translate_branch_evolution() {
        let response = EvolutionChainResponse.eeveeStub

        let model = self.translator.convert(from: response)

        XCTAssertEqual(model.evolutionChains.count, response.chain.evolvesTo.count)
    }
}

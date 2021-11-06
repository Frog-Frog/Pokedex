//
//  PokeAPIDataStoreTests.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/09/05.
//

import XCTest
@testable import DataStore

final class PokeAPIDataStoreTests: XCTestCase {

    private var pokeAPIDataStore: PokeAPIDataStore!

    private var dataStoreMock: APIDataStoreMock!

    override func setUp() {
        self.injection()
    }

    private func injection() {
        self.dataStoreMock = APIDataStoreMock()
        self.pokeAPIDataStore = PokeAPIDataStoreImpl(dataStore: self.dataStoreMock)
    }

    func test_success() {
        self.dataStoreMock.requestHandler = { _ in
            return JsonParser.data(from: "PokemonList")
        }
        Task {
            do {
                let _: PokemonListResponse = try await self.pokeAPIDataStore.request(PokemonListAPIRequest())
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }

    func test_api_failure() {
        self.dataStoreMock.requestHandler = { _ in
            throw TestError.stub
        }
        Task {
            do {
                let _: PokemonListResponse = try await self.pokeAPIDataStore.request(PokemonListAPIRequest())
                XCTFail("Don't throw network Error")
            }
        }
    }

    func test_parse_failure() {
        self.dataStoreMock.requestHandler = { _ in
            return JsonParser.data(from: "PokemonDetail_Bulbasaur")
        }
        Task {
            do {
                let _: PokemonListResponse = try await self.pokeAPIDataStore.request(PokemonListAPIRequest())
                XCTFail("Don't throw parse Error")
            }
        }
    }
}

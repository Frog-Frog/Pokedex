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
        self.dataStoreMock.requestHandler = { _, completion in
            completion(.success(JsonParser.data(from: "PokemonList")))
        }
        self.pokeAPIDataStore.request(PokemonListAPIRequest()) { (result: Result<PokemonListResponse, Error>) in
            switch result {
            case .success:
                return
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    func test_api_failure() {
        self.dataStoreMock.requestHandler = { _, completion in
            completion(.failure(TestError.stub))
        }
        self.pokeAPIDataStore.request(PokemonListAPIRequest()) { (result: Result<PokemonListResponse, Error>) in
            switch result {
            case .success:
                XCTFail("Don't throw network Error")
            case .failure:
                return
            }
        }
    }

    func test_parse_failure() {
        self.dataStoreMock.requestHandler = { _, completion in
            completion(.success(JsonParser.data(from: "PokemonDetail_Bulbasaur")))
        }
        self.pokeAPIDataStore.request(PokemonListAPIRequest()) { (result: Result<PokemonListResponse, Error>) in
            switch result {
            case .success:
                XCTFail("Don't throw parse Error")
            case .failure:
                return
            }
        }
    }
}

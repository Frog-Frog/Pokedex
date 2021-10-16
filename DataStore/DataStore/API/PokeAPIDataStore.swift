//
//  PokeAPIDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Foundation

enum PokeAPIDataStoreProvider {

    static func provide() -> PokeAPIDataStore {
        return PokeAPIDataStoreImpl(dataStore: APIDataStoreProvider.provide())
    }
}

/// @mockable
protocol PokeAPIDataStore {

    /// PokeAPI用のAPI処理
    /// これを使用することで、APIで取得したDataからPokeAPIのResponseのパースをやってくれる
    /// - Parameters:
    ///   - request: リクエスト構造体
    ///   - completion: 完了時処理
    func request<T: Decodable>(_ request: PokeAPIRequestable, completion: @escaping (Result<T, Error>) -> Void)

    @available(iOS 15.0.0, *)
    func request<T: Decodable>(_ request: PokeAPIRequestable) async throws -> T
}

struct PokeAPIDataStoreImpl: PokeAPIDataStore {

    let dataStore: APIDataStore

    func request<T: Decodable>(_ request: PokeAPIRequestable, completion: @escaping (Result<T, Error>) -> Void) {
        self.dataStore.request(request) { result in
            completion(result.flatMap {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let response = try decoder.decode(T.self, from: $0)
                    return .success(response)
                } catch {
                    return .failure(error)
                }
            })
        }
    }

    @available(iOS 15.0.0, *)
    func request<T: Decodable>(_ request: PokeAPIRequestable) async throws -> T {
        let data = try await self.dataStore.request(request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(T.self, from: data)
        return response
    }
}

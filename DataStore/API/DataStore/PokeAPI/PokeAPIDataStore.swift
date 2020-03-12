//
//  PokeAPIDataStore.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Foundation

enum PokeAPIDataStoreProvider {

    static func provide() -> PokeAPIDataStore {
        return PokeAPIDataStoreImpl(dataStore: APIDataStoreProvider.provide())
    }
}

protocol PokeAPIDataStore {

    /// PokeAPI用のAPI処理
    /// これを使用することで、APIで取得したDataからPokeAPIのResponseのパースをやってくれる
    /// - Parameters:
    ///   - request: リクエスト構造体
    ///   - completion: 完了時処理
    func request<T: Decodable>(_ request: PokeAPIRequestable, completion: @escaping (Result<T, Error>) -> Void)
}

private struct PokeAPIDataStoreImpl: PokeAPIDataStore {

    let dataStore: APIDataStore

    func request<T: Decodable>(_ request: PokeAPIRequestable, completion: @escaping (Result<T, Error>) -> Void) {
        self.dataStore.request(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  APIDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

enum APIDataStoreProvider {

    static func provide() -> APIDataStore {
        return APIDataStoreImpl(session: Session.default)
    }
}

/// @mockable
protocol APIDataStore {
    func request(_ request: APIRequestable) async throws -> Data
}

private struct APIDataStoreImpl: APIDataStore {

    let session: Session

    func request(_ request: APIRequestable) async throws -> Data {
        try await withUnsafeThrowingContinuation { continueation in
            self.session
                .request(request.urlString, method: request.method, parameters: request.parameters)
                .responseData { response in
                    continueation.resume(with: response.result)
                }
        }
    }
}

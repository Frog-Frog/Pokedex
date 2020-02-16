//
//  PokeAPI.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Foundation

enum PokeAPI {
    
    static func request<T: Decodable>(_ request: PokeAPIRequestable,
                                      success: (T) -> Void,
                                      failure: API.Failure) {
        API.request(urlString: request.urlString,
                    method: request.method,
                    request: request.parameters,
                    success: { data in
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        do {
                            let response = try decoder.decode(T.self, from: data)
                            success(response)
                        } catch {
                            failure(error)
                        }
                    },
                    failure: failure)
    }
}

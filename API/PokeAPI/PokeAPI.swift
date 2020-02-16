//
//  PokeAPI.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Foundation

enum PokeAPI<Response: Decodable> {
    
    typealias Success = (Response) -> Void
    typealias Failure = API.Failure
    
    static func request(_ request: PokeAPIRequestable,
                        success: @escaping Success,
                        failure: @escaping Failure) {
        API.request(urlString: request.urlString,
                    method: request.method,
                    parameters: request.parameters,
                    success: { data in
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        do {
                            let response = try decoder.decode(Response.self, from: data)
                            success(response)
                        } catch {
                            failure(error)
                        }
                    },
                    failure: failure)
    }
}

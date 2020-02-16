//
//  APIRequestable.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

protocol APIRequestable: Encodable {
    var urlString: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
}

extension APIRequestable {
    
    var parameters: [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder.encodeToDictionary(self)
    }
}

//
//  PokeAPIRequestable.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

/// APIRequestable for PokeAPI
protocol PokeAPIRequestable: APIRequestable {

    var path: String { get }
}

extension PokeAPIRequestable {

    var urlString: String {
        return "https://pokeapi.co/api/v2/\(self.path)"
    }
}

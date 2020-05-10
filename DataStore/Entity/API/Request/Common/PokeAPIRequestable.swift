//
//  PokeAPIRequestable.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

/// PokeAPI用のAPIRequestable
protocol PokeAPIRequestable: APIRequestable {

    var path: String { get }
}

extension PokeAPIRequestable {

    var urlString: String {
        return "https://pokeapi.co/api/v2/\(self.path)"
    }

    // PokeAPIでは.getしか使わないのでデフォルト実装で.getを返す
    var method: HTTPMethod {
        return .get
    }
}

//
//  PokeAPIRequestable.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

/// PokeAPI用のAPIRequestable
protocol PokeAPIRequestable: APIRequestable {}

extension PokeAPIRequestable {
    
    // PokeAPIでは.getしか使わないのでデフォルト実装で.getを返す
    var method: HTTPMethod {
        return .get
    }
}

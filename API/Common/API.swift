//
//  API.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

enum API {
    
    typealias Success = (Data) -> Void
    typealias Failure = (Error) -> Void
    
    static func request(urlString: String,
                        method: HTTPMethod,
                        request: [String: Any],
                        success: Success,
                        failure: Failure) {
        
    }
}

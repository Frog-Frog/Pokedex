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
                        parameters: [String: Any],
                        success: @escaping Success,
                        failure: @escaping Failure) {
        Session.default
            .request(urlString, method: method, parameters: parameters)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    success(data)
                case .failure(let error):
                    failure(error)
                }
        }
    }
}

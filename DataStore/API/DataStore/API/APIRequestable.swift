//
//  APIRequestable.swift
//  API
//
//  Created by Tomosuke Okada on 2020/02/16.
//

import Alamofire
import Foundation

/// APIのリクエストする際に共通で欲しい情報
/// リクエスト構造体を作ってこのprotocolに準拠させれば良い
protocol APIRequestable: Encodable {
    
    /// 通信先URL
    var urlString: String { get }
    
    /// HTTPMethod
    var method: HTTPMethod { get }
    
    /// パラメータ
    var parameters: [String: Any] { get }
}

extension APIRequestable {
    
    /// パラメータに関しては、自身のパラメータをJsonEncoderを通じて生成する
    var parameters: [String: Any] {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder.encodeToDictionary(self)
    }
}

private extension JSONEncoder {
    
    /// Encodable構造体からDataに変換したのちに、Dictionaryにする(APIのパラメータ生成用)
    func encodeToDictionary<T: Encodable>(_ value: T) -> [String: Any] {
        do {
            let data = try self.encode(value)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return (jsonObject as? [String: Any]) ?? [:]
        } catch {
            print(error.localizedDescription)
            return [:]
        }
    }
}

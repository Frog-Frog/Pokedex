//
//  JsonParser.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import Foundation

enum JsonParser {

    static func parseJson<T: Decodable>(_ fileName: String) -> T {
        do {
            let data = self.data(from: fileName)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    static func data(from fileName: String) -> Data {
        let path = Bundle.current.path(forResource: fileName, ofType: "json")!
        let url = URL(fileURLWithPath: path)
        do {
            return try Data(contentsOf: url)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

private extension Bundle {

    static var current: Self {
        class DummyClass {}
        return .init(for: type(of: DummyClass()))
    }
}

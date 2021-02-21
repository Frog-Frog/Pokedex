//
//  JsonPerser.swift
//  PokedexTests
//
//  Created by Tomosuke Okada on 2021/02/21.
//

import Foundation

enum JsonPerser {

    static func parseJson<T: Decodable>(_ fileName: String) -> T {
        let path = Bundle.current.path(forResource: fileName, ofType: "json")!
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
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

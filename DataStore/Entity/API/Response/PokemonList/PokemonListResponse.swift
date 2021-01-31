//
//	PokemonListResponse.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

public struct PokemonListResponse: Decodable {

    public let count: Int

    public let previous: String?

    public let next: String?

    public let results: [NamedURLResource]
}

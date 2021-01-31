//
//	PokemonListResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct PokemonListResponse: Decodable {

    public let count: Int

    public let previous: String?

    public let next: String?

    public let results: [NamedURLResource]
}

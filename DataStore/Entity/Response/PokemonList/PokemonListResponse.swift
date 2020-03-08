//
//	PokemonListResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct PokemonListResponse: Decodable {
    
	public let count: Int
	public let results: [Pokemon]
}

extension PokemonListResponse {
    
    public struct Pokemon: Decodable {
    
        public let name: String
    }
}

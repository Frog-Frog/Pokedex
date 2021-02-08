//
//  NamedAPIResource.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/31.
//

import Foundation

/// Common name & URL resource.
public struct NamedURLResource: Decodable {

    public let name: String

    public let url: String
}

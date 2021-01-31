//
//  ItemListResponse.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2021/01/30.
//

import Foundation

public struct ItemListResponse: Decodable {

    public let count: Int

    public let next: String?

    public let previous: String?

    public let results: [NamedURLResource]
}

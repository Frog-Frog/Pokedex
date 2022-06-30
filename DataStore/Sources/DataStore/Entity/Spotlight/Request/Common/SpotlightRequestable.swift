//
//  SpotlightRequestable.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import Foundation

protocol SpotlightRequestable {

    var title: String { get }

    var imageData: Data { get }

    var description: String { get }

    var keywords: [String] { get }

    var urlScheme: String { get }

    var domainIdentifier: String { get }
}

extension SpotlightRequestable {

    var domainIdentifier: String {
        return "pokedex"
    }
}

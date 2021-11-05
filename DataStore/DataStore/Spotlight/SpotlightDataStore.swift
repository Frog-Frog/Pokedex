//
//  SpotlightDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import CoreSpotlight
import Foundation
import MobileCoreServices

enum SpotlightDataStoreProvider {

    static func provide() -> SpotlightDataStore {
        return SpotlightDataStoreImpl()
    }
}

/// @mockable
protocol SpotlightDataStore {

    func save(_ request: SpotlightRequestable)
}

private struct SpotlightDataStoreImpl: SpotlightDataStore {

    func save(_ request: SpotlightRequestable) {
        let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.data)
        attributeSet.title = request.title
        attributeSet.contentDescription = request.description
        attributeSet.thumbnailData = request.imageData
        attributeSet.keywords = request.keywords

        let item = CSSearchableItem(
            uniqueIdentifier: request.urlScheme,
            domainIdentifier: request.domainIdentifier,
            attributeSet: attributeSet
        )
        CSSearchableIndex.default().indexSearchableItems([item], completionHandler: nil)
    }
}

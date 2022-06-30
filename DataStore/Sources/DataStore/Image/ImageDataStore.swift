//
//  ImageDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/05/10.
//

import Foundation
import Nuke

enum ImageDataStoreProvider {

    static func provide() -> ImageDataStore {
        return ImageDataStoreImpl(pipeline: ImagePipeline.shared)
    }
}

/// @mockable
protocol ImageDataStore {
    func load(from url: URL) async throws -> Data
}

private struct ImageDataStoreImpl: ImageDataStore {

    let pipeline: ImagePipeline

    func load(from url: URL) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            self.pipeline.loadData(with: ImageRequest(url: url)) { result in
                continuation.resume(with: result.map { $0.data })
            }
        }
    }
}

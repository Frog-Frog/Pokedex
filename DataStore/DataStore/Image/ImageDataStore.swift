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

protocol ImageDataStore {

    typealias Completion = (Result<Data, Error>) -> Void

    func load(from url: URL, completion: @escaping Completion)
}

private struct ImageDataStoreImpl: ImageDataStore {

    let pipeline: ImagePipeline

    func load(from url: URL, completion: @escaping Completion) {
        self.pipeline.loadData(with: ImageRequest(url: url)) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  RealmDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation
import RealmSwift

enum RealmDataStoreProvider {

    static func provide() -> RealmDataStore {
        return RealmDataStoreImpl(realm: (try? Realm()))
    }
}

protocol RealmDataStore {
    func addObject(_ object: Object)
    func deleteObject(_ object: Object)
    func getObjects<T: Object>() -> Results<T>?
}

private struct RealmDataStoreImpl: RealmDataStore {

    let realm: Realm?

    func addObject(_ object: Object) {
        try? self.realm?.write {
            self.realm?.add(object, update: .all)
        }
    }

    func deleteObject(_ object: Object) {
        try? self.realm?.write {
            self.realm?.delete(object)
        }
    }

    func getObjects<T: Object>() -> Results<T>? {
        return self.realm?.objects(T.self)
    }
}

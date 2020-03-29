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
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
        return RealmDataStoreImpl(realm: (try? Realm()))
    }
}

protocol RealmDataStore {
    func addObject(_ object: Object)
    func deleteResult<T: Object>(_ result: Results<T>)
    func getObjects<T: Object>() -> Results<T>?
}

private struct RealmDataStoreImpl: RealmDataStore {

    let realm: Realm?

    func addObject(_ object: Object) {
        try? self.realm?.write {
            self.realm?.add(object, update: .all)
        }
    }

    func deleteResult<T: Object>(_ result: Results<T>) {
        try? self.realm?.write {
            self.realm?.delete(result)
        }
    }

    func getObjects<T: Object>() -> Results<T>? {
        return self.realm?.objects(T.self)
    }
}

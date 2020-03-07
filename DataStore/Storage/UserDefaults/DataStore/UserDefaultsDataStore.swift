//
//  UserDefaultsDataStore.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/07.
//

import Foundation

enum UserDefaultsDataStoreProvider {
    
    static func provide() -> UserDefaultsDataStore {
        return UserDefaultsDataStoreImpl(userDefaults: UserDefaults.standard)
    }
}

protocol UserDefaultsDataStore {
    func get<T>(key: String) -> T?
    func set(value: Any, key: String)
    func delete(key: String)
}

private struct UserDefaultsDataStoreImpl: UserDefaultsDataStore {
    
    let userDefaults: UserDefaults
    
    func get<T>(key: String) -> T? {
        return self.userDefaults.object(forKey: key) as? T
    }
    
    func set(value: Any, key: String) {
        self.userDefaults.set(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func delete(key: String) {
        self.userDefaults.set(nil, forKey: key)
        self.userDefaults.synchronize()
    }
}

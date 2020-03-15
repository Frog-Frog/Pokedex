//
//  FavoritePokemon.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/15.
//

import Foundation
import RealmSwift

public final class FavoritePokemon: Object {

    @objc dynamic public var id: Int = 0

    @objc dynamic public var name: String = ""

    public override class func primaryKey() -> String? {
        return "id"
    }

    func setValue(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

//
//	VersionGameIndex.swift
//  DataStore
//
//  Created by Tomosuke Okada on 2020/03/11.
//
import Foundation

public struct VersionGameIndex: Decodable {

    /// The internal id of an API resource within game data.(ゲームデータ内のAPIリソースの内部ID)
    public let gameIndex: Int

    /// The version relevent to this game index.(バージョンの情報)
    public let version: NamedURLResource
}

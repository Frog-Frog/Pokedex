//
//	VersionGameIndex.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct VersionGameIndex: Decodable {
	
    /// The internal id of an API resource within game data.(ゲームデータ内のAPIリソースの内部ID)
    public let gameIndex: Int
	
    /// The version relevent to this game index.(バージョンの情報)
    public let version: Version
}

extension VersionGameIndex {
    
    public struct Version: Decodable {
        
        /// The name for this resource.(バージョン名)
        public let name: String
        
        public let url: String
    }
}

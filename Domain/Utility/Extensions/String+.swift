//
//  String+.swift
//  Domain
//
//  Created by Tomosuke Okada on 2020/12/19.
//

import Foundation

extension String {

    func capitalizingFirstLetter() -> String {
        return "\(self.prefix(1).uppercased())\(self.lowercased().dropFirst())"
    }
}

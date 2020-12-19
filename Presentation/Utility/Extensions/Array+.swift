//
//  Array+.swift
//  Presentation
//
//  Created by masaki hasegawa on 2020/12/15.
//

import Foundation

extension Array {

    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }

    subscript (reverse index: Int) -> Element {
        return self[self.count - index - 1]
    }
}

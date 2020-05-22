//
//  RandomPokemonNumberGenrator.swift
//  QuizTodayExtension
//
//  Created by Tomosuke Okada on 2020/05/22.
//

import Foundation

enum RandomPokemonNumberGenrator {

    static func generate() -> Int {
        return Int.random(in: 1...807)
    }
}
